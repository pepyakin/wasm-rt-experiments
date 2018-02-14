#![no_std]
#![feature(lang_items)]
#![feature(core_intrinsics)]

#[no_mangle]
#[lang = "panic_fmt"]
pub extern "C" fn panic_fmt(
    _args: ::core::fmt::Arguments,
    _file: &'static str,
    _line: u32,
    _col: u32,
) -> ! {
    use core::intrinsics;
    unsafe {
        intrinsics::abort();
    }
}

#[no_mangle]
pub fn returns_u64() -> u64 {
    0xDEAD_BEAF_CAFE_BABE
}
