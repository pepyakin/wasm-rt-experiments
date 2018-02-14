(module
 (type $0 (func (result i64)))
 (type $1 (func (param i64)))
 (type $2 (func (param i32 i32 i32 i32)))
 (type $3 (func))
 (type $legaltype$runtime_returns_u64 (func (result i32)))
 (type $legaltype$runtime_takes_u64 (func (param i32 i32)))
 (import "env" "runtime_returns_u64" (func $runtime_returns_u64 (result i64)))
 (import "env" "runtime_takes_u64" (func $runtime_takes_u64 (param i64)))
 (import "env" "runtime_returns_u64" (func $legalimport$runtime_returns_u64 (result i32)))
 (import "env" "runtime_takes_u64" (func $legalimport$runtime_takes_u64 (param i32 i32)))
 (global $tempRet0 (mut i32) (i32.const 0)) (func (export "getTempRet0") (result i32) (get_global $tempRet0)) (func (export "setTempRet0") (param i32) (set_global $tempRet0 (get_local 0)))
 (table 0 anyfunc)
 (memory $0 17)
 (data (i32.const 4) "\10\00\10\00")
 (export "memory" (memory $0))
 (export "rust_begin_unwind" (func $rust_begin_unwind))
 (export "test" (func $test))
 (export "takes_u64" (func $legalstub$takes_u64))
 (export "returns_u64" (func $legalstub$returns_u64))
 (func $rust_begin_unwind (; 4 ;) (type $2) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (param $var$3 i32)
  (unreachable)
 )
 (func $test (; 5 ;) (type $3)
  (local $var$0 i64)
  (block $label$1
   (br_if $label$1
    (i64.ne
     (call $legalfunc$runtime_returns_u64)
     (i64.const -4822681336602061)
    )
   )
   (call $legalfunc$runtime_takes_u64
    (i64.const -4822681336602061)
   )
   (return)
  )
  (unreachable)
 )
 (func $takes_u64 (; 6 ;) (type $1) (param $var$0 i64)
  (block $label$1
   (br_if $label$1
    (i64.ne
     (get_local $var$0)
     (i64.const 81985529216486895)
    )
   )
   (return)
  )
  (unreachable)
 )
 (func $returns_u64 (; 7 ;) (type $0) (result i64)
  (i64.const -2401053364084360514)
 )
 (func $legalstub$takes_u64 (; 8 ;) (param $0 i32) (param $1 i32)
  (call $takes_u64
   (i64.or
    (i64.extend_u/i32
     (get_local $0)
    )
    (i64.shl
     (i64.extend_u/i32
      (get_local $1)
     )
     (i64.const 32)
    )
   )
  )
 )
 (func $legalstub$returns_u64 (; 9 ;) (result i32)
  (local $0 i64)
  (set_local $0
   (call $returns_u64)
  )
  (set_global $tempRet0
   (i32.wrap/i64
    (i64.shr_u
     (get_local $0)
     (i64.const 32)
    )
   )
  )
  (i32.wrap/i64
   (get_local $0)
  )
 )
 (func $legalfunc$runtime_returns_u64 (; 10 ;) (result i64)
  (i64.or
   (i64.extend_u/i32
    (call $legalimport$runtime_returns_u64)
   )
   (i64.shl
    (i64.extend_u/i32
     (get_global $tempRet0)
    )
    (i64.const 32)
   )
  )
 )
 (func $legalfunc$runtime_takes_u64 (; 11 ;) (param $0 i64)
  (call $legalimport$runtime_takes_u64
   (i32.wrap/i64
    (get_local $0)
   )
   (i32.wrap/i64
    (i64.shr_u
     (get_local $0)
     (i64.const 32)
    )
   )
  )
 )
)
