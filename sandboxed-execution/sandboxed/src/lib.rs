#![no_std]
#![feature(lang_items)]
#![feature(core_intrinsics)]

#[no_mangle]
#[lang = "panic_fmt"]
pub extern "C" fn panic_fmt() -> ! {
    unsafe {
        core::intrinsics::abort();
    }
}

extern "C" {
    fn print_str(msg_data: *const u8, msg_len: usize);
}

fn print(msg: &str) {
    unsafe {
        print_str(msg.as_ptr(), msg.len());
    }
}

#[no_mangle]
pub fn entrypoint() {
    print("hello from sandboxed module!");
}
