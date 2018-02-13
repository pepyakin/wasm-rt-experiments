#![no_std]
#![feature(lang_items)]
#![feature(core_intrinsics)]
#![feature(global_allocator)]
#![feature(alloc)]

#[macro_use]
extern crate alloc;
extern crate rlibc;
extern crate wee_alloc;

use alloc::vec::Vec;

#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

#[no_mangle]
#[lang = "panic_fmt"]
pub extern "C" fn panic_fmt() -> ! {
    unsafe {
        core::intrinsics::abort();
    }
}

enum Void {
}

extern "C" {
    fn debug(msg_data: *const u8, msg_len: usize);

    fn sandbox_new() -> usize;
    fn sandbox_register_func(
        sandbox_idx: usize,
        module_name_data: *const u8,
        module_name_len: usize,
        field_name_data: *const u8,
        field_name_len: usize,
        func_ptr: *const Void,
    );
    fn sandbox_instantiate(
        sandbox_idx: usize,
        filename_data: *const u8,
        filename_len: usize,
    ) -> usize;
    fn sandbox_invoke(
        sandbox_idx: usize,
        instance_idx: usize,
        export_name_data: *const u8,
        export_name_len: usize,
    );
    fn sandbox_peek_mem(
        sandbox_idx: usize,
        instance_idx: usize,
        export_name_data: *const u8,
        export_name_len: usize,
        local_ptr: *mut Void,
        remote_ptr: *const Void,
        size: usize,
    );
    fn sandbox_calling_sandbox() -> usize;
    fn sandbox_calling_instance() -> usize;
}

struct Instance {
    sandbox_idx: usize,
    instance_idx: usize,
}

impl Instance {
    unsafe fn from_raw(sandbox: &Sandbox, instance_idx: usize) -> Instance {
        Instance {
            sandbox_idx: sandbox.raw_idx,
            instance_idx,
        }
    }

    fn calling() -> Instance {
        let sandbox = Sandbox::calling();
        unsafe { Instance::from_raw(&sandbox, sandbox_calling_instance()) }
    }

    fn invoke(&self, export_name: &str) {
        unsafe {
            sandbox_invoke(
                self.sandbox_idx,
                self.instance_idx,
                export_name.as_ptr(),
                export_name.len(),
            )
        }
    }

    fn peek_memory(&self, memory_name: &str, remote_ptr: *const Void, len: usize) -> Vec<u8> {
        let mut buf = vec![0; len];
        unsafe {
            sandbox_peek_mem(
                self.sandbox_idx,
                self.instance_idx,
                memory_name.as_ptr(),
                memory_name.len(),
                buf.as_mut_ptr() as *mut Void,
                remote_ptr,
                len,
            );
        }
        buf
    }
}

struct Sandbox {
    raw_idx: usize,
}

impl Sandbox {
    fn new() -> Sandbox {
        Sandbox {
            raw_idx: unsafe { sandbox_new() },
        }
    }

    fn calling() -> Sandbox {
        unsafe { Sandbox::from_raw(sandbox_calling_sandbox()) }
    }

    unsafe fn from_raw(raw_idx: usize) -> Sandbox {
        Sandbox { raw_idx }
    }

    fn register_func2<P1, P2>(&mut self, module_name: &str, field_name: &str, func: fn(P1, P2)) {
        unsafe {
            sandbox_register_func(
                self.raw_idx,
                module_name.as_ptr(),
                module_name.len(),
                field_name.as_ptr(),
                field_name.len(),
                func as *const Void,
            );
        }
    }

    fn instantiate(&self, filename: &str) -> Instance {
        let instance_idx =
            unsafe { sandbox_instantiate(self.raw_idx, filename.as_ptr(), filename.len()) };
        Instance {
            sandbox_idx: self.raw_idx,
            instance_idx: instance_idx,
        }
    }
}

fn print_str(remote_msg_data: *const Void, remote_msg_len: usize) {
    let calling_instance = Instance::calling();
    let msg =
        calling_instance.peek_memory("memory", remote_msg_data as *const Void, remote_msg_len);

    unsafe {
        debug(msg.as_ptr(), msg.len());
    }
}

#[no_mangle]
pub fn entrypoint() {
    let mut sandbox = Sandbox::new();
    sandbox.register_func2("env", "print_str", print_str);

    let instance = sandbox.instantiate("sandboxed/sandboxed.wasm");
    instance.invoke("entrypoint");
}
