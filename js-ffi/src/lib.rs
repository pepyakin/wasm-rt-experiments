#![no_std]
#![feature(lang_items)]
#![feature(core_intrinsics)]

use core::intrinsics;

#[no_mangle]
#[lang = "panic_fmt"]
pub extern "C" fn panic_fmt(
    _args: ::core::fmt::Arguments,
    _file: &'static str,
    _line: u32,
    _col: u32,
) -> ! {
    unsafe {
        intrinsics::abort();
    }
}

extern "C" {
    fn runtime_takes_u64(v: u64);
    fn runtime_returns_u64() -> u64;
}

#[no_mangle]
pub unsafe fn test() {
    let v = runtime_returns_u64();
    assert_eq_or_trap(v, 0xFFEEDDCC_00112233);

    runtime_takes_u64(0xFFEEDDCC_00112233);
}

#[no_mangle]
pub unsafe fn takes_u64(a: u64) {
    assert_eq_or_trap(a, 0x0123_4567_89AB_CDEF);
}

#[no_mangle]
pub fn returns_u64() -> u64 {
    0xDEAD_BEAF_CAFE_BABE
}

fn assert_eq_or_trap<V: PartialEq + Eq + Copy>(a: V, b: V) {
    // Use intrinsics::abort() to not pull in any formatting infrastructure.
    if a != b {
        unsafe {
            intrinsics::abort();
        }
    }
}
