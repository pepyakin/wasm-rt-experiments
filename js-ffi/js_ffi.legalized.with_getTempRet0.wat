(module
(func (export "getTempRet0") (result i32) (get_global $tempRet0)) (type $0 (func (param i32 i32 i32 i32)))
 (type $1 (func (result i64)))
 (global $tempRet0 (mut i32) (i32.const 0))
 (table 0 anyfunc)
 (memory $0 17)
 (data (i32.const 4) "\10\00\10\00")
 (export "memory" (memory $0))
 (export "rust_begin_unwind" (func $rust_begin_unwind))
 (export "returns_u64" (func $legalstub$returns_u64))
 (func $rust_begin_unwind (; 0 ;) (type $0) (param $var$0 i32) (param $var$1 i32) (param $var$2 i32) (param $var$3 i32)
  (unreachable)
 )
 (func $returns_u64 (; 1 ;) (type $1) (result i64)
  (i64.const -2401053364084360514)
 )
 (func $legalstub$returns_u64 (; 2 ;) (result i32)
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
)
