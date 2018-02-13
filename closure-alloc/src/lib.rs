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

enum Void {}

extern "C" {
    /// Print message to the console.
    fn debug(msg_ptr: *const u8, msg_len: usize);

    /// External function which should load value from a key-value storage
    /// specified by the key (represented as `key_ptr` and `key_len`).
    /// 
    /// This function takes `cb` callback. It's purpose is to allocate space
    /// for result value and return pointer to it. After `ext_load_storage` receives
    /// this pointer, it will copy value in memory at this pointer.
    /// 
    /// It is undefined behavior to return pointer to a memory block with smaller size.
    fn ext_load_storage(
        key_ptr: *const u8,
        key_len: usize,
        cb: extern "C" fn(*mut Void, usize) -> *mut u8,
        cb_data: *mut Void,
    );
}

#[no_mangle]
#[lang = "panic_fmt"]
pub extern "C" fn panic_fmt(
    args: ::core::fmt::Arguments,
    file: &'static str,
    line: u32,
    col: u32,
) -> ! {
    use core::intrinsics;

    let msg = format!("{}:{}:{}:{}", args, file, line, col);
    unsafe {
        debug(msg.as_ptr(), msg.len());
        intrinsics::abort();
    }
}

#[inline(always)]
unsafe fn wrap_closure<F>(f: &F) -> (extern "C" fn(*mut Void, usize) -> *mut u8, *mut Void)
where
    F: FnOnce(usize) -> *mut u8,
{
    extern "C" fn wrapper<F>(closure_ptr: *mut Void, size: usize) -> *mut u8
    where
        F: FnOnce(usize) -> *mut u8,
    {
        let opt_closure = closure_ptr as *mut Option<F>;
        unsafe { (*opt_closure).take().unwrap()(size) }
    }

    let closure_data = f as *const _ as *mut Void;
    (wrapper::<F>, closure_data)
}

#[inline(never)]
fn reserve_vec_space(vec: &mut Vec<u8>, size: usize) -> *mut u8 {
    *vec = Vec::with_capacity(size);
    unsafe {
        vec.set_len(size);
    }
    vec.as_mut_ptr()
}

/// Load value from key-value storage.
fn load_storage(key: &[u8]) -> Vec<u8> {
    let mut value = Vec::new();
    {
        let reserve_space = |size: usize| {
            // We do this indirection to prevent inlining for easier exploration of
            // disassembled wasm code.
            reserve_vec_space(&mut value, size)
        };

        unsafe {
            // Wrap closure into simple `extern "C"` function (`cb`) and 
            // closure data (`cb_data`).
            let (cb, cb_data) = wrap_closure(&reserve_space);
            ext_load_storage(key.as_ptr(), key.len(), cb, cb_data);
        }
    }
    value
}

#[no_mangle]
pub fn entrypoint() {
    let value = load_storage(b"hello");
    assert_eq!(&*value, b"world");

    panic!("it worked!");
}
