(module
(export "table" (table 0))  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;8;) (func))
  (type (;9;) (func (param i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32)))
  (import "env" "debug" (func $debug (type 2)))
  (import "env" "sandbox_calling_instance" (func $sandbox_calling_instance (type 3)))
  (import "env" "sandbox_calling_sandbox" (func $sandbox_calling_sandbox (type 3)))
  (import "env" "sandbox_instantiate" (func $sandbox_instantiate (type 4)))
  (import "env" "sandbox_invoke" (func $sandbox_invoke (type 5)))
  (import "env" "sandbox_new" (func $sandbox_new (type 3)))
  (import "env" "sandbox_peek_mem" (func $sandbox_peek_mem (type 6)))
  (import "env" "sandbox_register_func" (func $sandbox_register_func (type 7)))
  (func $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h845b11d78413200aE (type 0) (param i32 i32 i32)
    (local i32 i32)
    (set_local 4
      (current_memory))
    (drop
      (grow_memory
        (tee_local 3
          (i32.shr_u
            (i32.add
              (i32.shl
                (get_local 2)
                (i32.const 2))
              (i32.const 65543))
            (i32.const 16)))))
    (i32.store offset=4
      (tee_local 2
        (i32.shl
          (get_local 4)
          (i32.const 16)))
      (i32.const 0))
    (i32.store
      (get_local 2)
      (i32.add
        (i32.shl
          (get_local 3)
          (i32.const 16))
        (i32.const -8)))
    (i32.store offset=4
      (get_local 0)
      (get_local 2))
    (i32.store
      (get_local 0)
      (i32.const 0)))
  (func $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h21fa3d6e92f34193E (type 1) (param i32 i32) (result i32)
    (i32.const 512))
  (func $_ZN9wee_alloc17alloc_with_refill17h039202fa44f664a4E (type 10) (param i32 i32 i32 i32 i32)
    (local i32 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local 6
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (block  ;; label = @1
      (block  ;; label = @2
        (block  ;; label = @3
          (block  ;; label = @4
            (block  ;; label = @5
              (block  ;; label = @6
                (br_if 0 (;@6;)
                  (i32.eqz
                    (i32.load
                      (get_local 2))))
                (call $_ZN9wee_alloc15alloc_first_fit17h1152ca847bc55fd0E
                  (i32.add
                    (get_local 6)
                    (i32.const 8))
                  (get_local 1)
                  (get_local 2)
                  (get_local 3)
                  (get_local 4))
                (br_if 1 (;@5;)
                  (i32.eqz
                    (i32.load offset=8
                      (get_local 6))))
                (call_indirect (type 0)
                  (i32.add
                    (get_local 6)
                    (i32.const 8))
                  (get_local 3)
                  (get_local 1)
                  (i32.load offset=12
                    (get_local 4)))
                (br_if 2 (;@4;)
                  (i32.ne
                    (i32.load offset=8
                      (get_local 6))
                    (i32.const 1)))
                (i32.store
                  (get_local 0)
                  (i32.const 1))
                (br 5 (;@1;)))
              (call_indirect (type 0)
                (i32.add
                  (get_local 6)
                  (i32.const 8))
                (get_local 3)
                (get_local 1)
                (i32.load offset=12
                  (get_local 4)))
              (br_if 2 (;@4;)
                (i32.ne
                  (i32.load offset=8
                    (get_local 6))
                  (i32.const 1)))
              (i32.store
                (get_local 0)
                (i32.const 1))
              (br 4 (;@2;)))
            (i32.store
              (get_local 0)
              (i32.const 0))
            (i32.store offset=4
              (get_local 0)
              (i32.load offset=12
                (get_local 6)))
            (br 3 (;@3;)))
          (i32.store offset=4
            (tee_local 5
              (i32.load offset=12
                (get_local 6)))
            (i32.load
              (get_local 2)))
          (i32.store
            (get_local 2)
            (get_local 5))
          (br 1 (;@5;)))
        (i32.store offset=4
          (tee_local 5
            (i32.load offset=12
              (get_local 6)))
          (i32.load
            (get_local 2)))
        (i32.store
          (get_local 2)
          (get_local 5)))
      (call $_ZN9wee_alloc15alloc_first_fit17h1152ca847bc55fd0E
        (get_local 0)
        (get_local 1)
        (get_local 2)
        (get_local 3)
        (get_local 4)))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local 6)
        (i32.const 16))))
  (func $_ZN9wee_alloc15alloc_first_fit17h1152ca847bc55fd0E (type 10) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    (set_local 5
      (i32.shl
        (get_local 1)
        (i32.const 2)))
    (block  ;; label = @1
      (block  ;; label = @2
        (loop  ;; label = @3
          (br_if 1 (;@2;)
            (i32.eqz
              (tee_local 6
                (i32.load
                  (get_local 2)))))
          (br_if 2 (;@1;)
            (i32.ge_u
              (tee_local 7
                (i32.load
                  (get_local 6)))
              (get_local 5)))
          (set_local 2
            (i32.add
              (get_local 6)
              (i32.const 4)))
          (br 0 (;@3;)))
        (unreachable))
      (i32.store
        (get_local 0)
        (i32.const 1))
      (return))
    (set_local 8
      (i32.add
        (get_local 6)
        (i32.const 8)))
    (block  ;; label = @4
      (block  ;; label = @5
        (br_if 0 (;@5;)
          (i32.le_u
            (i32.add
              (i32.shl
                (call_indirect (type 1)
                  (get_local 3)
                  (get_local 1)
                  (i32.load offset=16
                    (get_local 4)))
                (i32.const 2))
              (i32.const 8))
            (i32.sub
              (get_local 7)
              (get_local 5))))
        (i32.store
          (get_local 2)
          (i32.load offset=4
            (get_local 6)))
        (br 1 (;@4;)))
      (set_local 1
        (i32.load
          (get_local 6)))
      (i32.store offset=4
        (tee_local 7
          (i32.add
            (get_local 8)
            (get_local 5)))
        (i32.const 0))
      (i32.store
        (get_local 7)
        (i32.add
          (i32.sub
            (get_local 1)
            (get_local 5))
          (i32.const -8)))
      (i32.store
        (get_local 6)
        (get_local 5))
      (i32.store
        (get_local 2)
        (get_local 7))
      (i32.store offset=4
        (get_local 7)
        (i32.load offset=4
          (get_local 6))))
    (i32.store offset=4
      (get_local 0)
      (get_local 8))
    (i32.store
      (get_local 0)
      (i32.const 0)))
  (func $_ZN78_$LT$$RF$$u27$a$u20$wee_alloc..WeeAlloc$u20$as$u20$alloc..allocator..Alloc$GT$5alloc28_$u7b$$u7b$closure$u7d$$u7d$17h8c0f59dc6cb829d8E (type 10) (param i32 i32 i32 i32 i32)
    (local i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local 5
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (call $_ZN9wee_alloc17alloc_with_refill17h039202fa44f664a4E
      (i32.add
        (get_local 5)
        (i32.const 8))
      (i32.load
        (i32.load
          (get_local 1)))
      (get_local 2)
      (get_local 3)
      (get_local 4))
    (set_local 2
      (i32.const 1))
    (block  ;; label = @1
      (block  ;; label = @2
        (br_if 0 (;@2;)
          (i32.ne
            (i32.load offset=8
              (get_local 5))
            (i32.const 1)))
        (i32.store offset=4
          (get_local 0)
          (i32.const 0))
        (i32.store
          (i32.add
            (get_local 0)
            (i32.const 8))
          (i32.load offset=4
            (get_local 1)))
        (set_local 1
          (i32.load
            (i32.add
              (get_local 1)
              (i32.const 8))))
        (set_local 3
          (i32.const 2))
        (br 1 (;@1;)))
      (set_local 2
        (i32.const 0))
      (set_local 1
        (i32.load offset=12
          (get_local 5)))
      (set_local 3
        (i32.const 0)))
    (i32.store
      (get_local 0)
      (get_local 2))
    (i32.store
      (i32.add
        (i32.add
          (get_local 0)
          (i32.shl
            (get_local 3)
            (i32.const 2)))
        (i32.const 4))
      (get_local 1))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local 5)
        (i32.const 16))))
  (func $_ZN4core3ptr13drop_in_place17ha364d4008367b191E (type 9) (param i32))
  (func $_ZN4core3ptr13drop_in_place17h075f9de043c465dbE (type 9) (param i32))
  (func $_ZN102_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$LT$$u27$a$GT$$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h96d8f0e8b44ee985E (type 0) (param i32 i32 i32)
    (local i32 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local 4
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 16))))
    (call $_ZN9wee_alloc17alloc_with_refill17h039202fa44f664a4E
      (i32.add
        (get_local 4)
        (i32.const 8))
      (tee_local 3
        (select
          (tee_local 2
            (i32.mul
              (get_local 2)
              (get_local 2)))
          (i32.const 2048)
          (i32.gt_u
            (get_local 2)
            (i32.const 2048))))
      (i32.load
        (get_local 1))
      (i32.const 64)
      (i32.const 64))
    (set_local 2
      (i32.const 1))
    (block  ;; label = @1
      (br_if 0 (;@1;)
        (i32.eq
          (i32.load offset=8
            (get_local 4))
          (i32.const 1)))
      (set_local 2
        (i32.const 0))
      (i32.store offset=4
        (tee_local 1
          (i32.load offset=12
            (get_local 4)))
        (i32.const 0))
      (i32.store offset=4
        (get_local 0)
        (get_local 1))
      (i32.store
        (get_local 1)
        (i32.add
          (i32.shl
            (get_local 3)
            (i32.const 2))
          (i32.const -8))))
    (i32.store
      (get_local 0)
      (get_local 2))
    (i32.store offset=4
      (i32.const 0)
      (i32.add
        (get_local 4)
        (i32.const 16))))
  (func $_ZN4core3ptr13drop_in_place17h075f9de043c465dbE.17 (type 9) (param i32))
  (func $_ZN102_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$LT$$u27$a$GT$$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h1bf855028006d072E (type 1) (param i32 i32) (result i32)
    (get_local 1))
  (func $memcpy (type 4) (param i32 i32 i32) (result i32)
    (local i32)
    (set_local 3
      (i32.const 0))
    (block  ;; label = @1
      (loop  ;; label = @2
        (br_if 1 (;@1;)
          (i32.eq
            (get_local 2)
            (get_local 3)))
        (i32.store8
          (i32.add
            (get_local 0)
            (get_local 3))
          (i32.load8_u
            (i32.add
              (get_local 1)
              (get_local 3))))
        (set_local 3
          (i32.add
            (get_local 3)
            (i32.const 1)))
        (br 0 (;@2;)))
      (unreachable))
    (get_local 0))
  (func $memmove (type 4) (param i32 i32 i32) (result i32)
    (local i32)
    (block  ;; label = @1
      (block  ;; label = @2
        (br_if 0 (;@2;)
          (i32.ge_u
            (get_local 1)
            (get_local 0)))
        (loop  ;; label = @3
          (br_if 2 (;@1;)
            (i32.eqz
              (get_local 2)))
          (i32.store8
            (i32.add
              (i32.add
                (get_local 0)
                (get_local 2))
              (i32.const -1))
            (i32.load8_u
              (i32.add
                (i32.add
                  (get_local 1)
                  (get_local 2))
                (i32.const -1))))
          (set_local 2
            (i32.add
              (get_local 2)
              (i32.const -1)))
          (br 0 (;@3;)))
        (unreachable))
      (set_local 3
        (get_local 0))
      (loop  ;; label = @4
        (br_if 1 (;@3;)
          (i32.eqz
            (get_local 2)))
        (i32.store8
          (get_local 3)
          (i32.load8_u
            (get_local 1)))
        (set_local 2
          (i32.add
            (get_local 2)
            (i32.const -1)))
        (set_local 1
          (i32.add
            (get_local 1)
            (i32.const 1)))
        (set_local 3
          (i32.add
            (get_local 3)
            (i32.const 1)))
        (br 0 (;@4;)))
      (unreachable))
    (get_local 0))
  (func $memset (type 4) (param i32 i32 i32) (result i32)
    (local i32)
    (set_local 3
      (i32.const 0))
    (block  ;; label = @1
      (loop  ;; label = @2
        (br_if 1 (;@1;)
          (i32.eq
            (get_local 2)
            (get_local 3)))
        (i32.store8
          (i32.add
            (get_local 0)
            (get_local 3))
          (get_local 1))
        (set_local 3
          (i32.add
            (get_local 3)
            (i32.const 1)))
        (br 0 (;@2;)))
      (unreachable))
    (get_local 0))
  (func $memcmp (type 4) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    (set_local 6
      (i32.const 0))
    (set_local 5
      (i32.const 0))
    (block  ;; label = @1
      (loop  ;; label = @2
        (br_if 1 (;@1;)
          (i32.ge_u
            (get_local 5)
            (get_local 2)))
        (set_local 3
          (i32.add
            (get_local 1)
            (get_local 5)))
        (set_local 4
          (i32.add
            (get_local 0)
            (get_local 5)))
        (set_local 5
          (i32.add
            (get_local 5)
            (i32.const 1)))
        (br_if 0 (;@2;)
          (i32.eq
            (tee_local 4
              (i32.load8_u
                (get_local 4)))
            (tee_local 3
              (i32.load8_u
                (get_local 3))))))
      (set_local 6
        (i32.sub
          (get_local 4)
          (get_local 3))))
    (get_local 6))
  (func $_ZN4core9panicking5panic17h388b19995485ab52E (type 9) (param i32)
    (call $_ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E)
    (unreachable))
  (func $_ZN4core9panicking9panic_fmt17h8d2a1d48b93388a4E (type 8)
    (unreachable)
    (unreachable))
  (func $rust_begin_unwind (type 8)
    (unreachable)
    (unreachable))
  (func $entrypoint (type 8)
    (local i32)
    (call $sandbox_register_func
      (tee_local 0
        (call $sandbox_new))
      (i32.const 1120)
      (i32.const 3)
      (i32.const 1136)
      (i32.const 9)
      (i32.const 1))
    (call $sandbox_invoke
      (get_local 0)
      (call $sandbox_instantiate
        (get_local 0)
        (i32.const 1152)
        (i32.const 24))
      (i32.const 1184)
      (i32.const 10)))
  (func $_ZN10privileged9print_str17hc7b3bc9f45422b51E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    (i32.store offset=4
      (i32.const 0)
      (tee_local 6
        (i32.sub
          (i32.load offset=4
            (i32.const 0))
          (i32.const 48))))
    (set_local 2
      (call $sandbox_calling_sandbox))
    (set_local 3
      (call $sandbox_calling_instance))
    (block  ;; label = @1
      (br_if 0 (;@1;)
        (i32.le_s
          (get_local 1)
          (i32.const -1)))
      (block  ;; label = @2
        (block  ;; label = @3
          (block  ;; label = @4
            (block  ;; label = @5
              (block  ;; label = @6
                (br_if 0 (;@6;)
                  (i32.eqz
                    (get_local 1)))
                (i32.store offset=24
                  (get_local 6)
                  (tee_local 5
                    (i32.shr_u
                      (i32.add
                        (get_local 1)
                        (i32.const 3))
                      (i32.const 2))))
                (br_if 1 (;@5;)
                  (i32.eqz
                    (tee_local 4
                      (i32.add
                        (i32.shl
                          (tee_local 5
                            (i32.add
                              (get_local 5)
                              (i32.const -1)))
                          (i32.const 2))
                        (i32.const 88)))))
                (br_if 1 (;@5;)
                  (i32.ge_u
                    (get_local 5)
                    (i32.const 256)))
                (i32.store offset=28
                  (get_local 6)
                  (i32.const 84))
                (i32.store
                  (i32.add
                    (get_local 6)
                    (i32.const 40))
                  (i32.const 1))
                (i32.store offset=36
                  (get_local 6)
                  (get_local 1))
                (i32.store offset=32
                  (get_local 6)
                  (i32.add
                    (get_local 6)
                    (i32.const 24)))
                (call $_ZN78_$LT$$RF$$u27$a$u20$wee_alloc..WeeAlloc$u20$as$u20$alloc..allocator..Alloc$GT$5alloc28_$u7b$$u7b$closure$u7d$$u7d$17h8c0f59dc6cb829d8E
                  (i32.add
                    (get_local 6)
                    (i32.const 8))
                  (i32.add
                    (get_local 6)
                    (i32.const 32))
                  (get_local 4)
                  (i32.add
                    (get_local 6)
                    (i32.const 28))
                  (i32.const 32))
                (br 2 (;@4;)))
              (set_local 5
                (i32.const 1))
              (br 2 (;@4;)))
            (i32.store
              (i32.add
                (get_local 6)
                (i32.const 40))
              (i32.const 1))
            (i32.store offset=36
              (get_local 6)
              (get_local 1))
            (i32.store offset=32
              (get_local 6)
              (i32.add
                (get_local 6)
                (i32.const 24)))
            (call $_ZN78_$LT$$RF$$u27$a$u20$wee_alloc..WeeAlloc$u20$as$u20$alloc..allocator..Alloc$GT$5alloc28_$u7b$$u7b$closure$u7d$$u7d$17h8c0f59dc6cb829d8E
              (i32.add
                (get_local 6)
                (i32.const 8))
              (i32.add
                (get_local 6)
                (i32.const 32))
              (i32.const 84)
              (i32.const 64)
              (i32.const 12)))
          (br_if 1 (;@5;)
            (i32.load offset=8
              (get_local 6)))
          (br_if 1 (;@5;)
            (i32.eqz
              (call $memset
                (tee_local 5
                  (i32.load offset=12
                    (get_local 6)))
                (i32.const 0)
                (get_local 1)))))
        (call $sandbox_peek_mem
          (get_local 2)
          (get_local 3)
          (i32.const 1200)
          (i32.const 6)
          (get_local 5)
          (get_local 0)
          (get_local 1))
        (call $debug
          (get_local 5)
          (get_local 1))
        (block  ;; label = @7
          (br_if 0 (;@7;)
            (i32.eqz
              (get_local 1)))
          (set_local 0
            (i32.add
              (get_local 5)
              (i32.const -4)))
          (set_local 5
            (i32.add
              (get_local 5)
              (i32.const -8)))
          (block  ;; label = @8
            (block  ;; label = @9
              (br_if 0 (;@9;)
                (i32.eqz
                  (tee_local 1
                    (i32.add
                      (i32.shl
                        (tee_local 2
                          (i32.add
                            (i32.shr_u
                              (i32.add
                                (get_local 1)
                                (i32.const 3))
                              (i32.const 2))
                            (i32.const -1)))
                        (i32.const 2))
                      (i32.const 88)))))
              (br_if 0 (;@9;)
                (i32.ge_u
                  (get_local 2)
                  (i32.const 256)))
              (i32.store
                (get_local 0)
                (i32.load
                  (get_local 1)))
              (br 1 (;@8;)))
            (i32.store
              (get_local 0)
              (i32.load offset=84
                (i32.const 0)))
            (set_local 1
              (i32.const 84)))
          (i32.store
            (get_local 1)
            (get_local 5)))
        (i32.store offset=4
          (i32.const 0)
          (i32.add
            (get_local 6)
            (i32.const 48)))
        (return))
      (unreachable)
      (unreachable))
    (call $_ZN4core9panicking5panic17h388b19995485ab52E
      (i32.const 1208))
    (unreachable))
  (func $__wasm_nullptr (type 8)
    (unreachable))
  (table (;0;) 9 9 anyfunc)
  (memory (;0;) 17)
  (export "memory" (memory 0))
  (export "memcpy" (func $memcpy))
  (export "memmove" (func $memmove))
  (export "memset" (func $memset))
  (export "memcmp" (func $memcmp))
  (export "rust_begin_unwind" (func $rust_begin_unwind))
  (export "entrypoint" (func $entrypoint))
  (elem (i32.const 0) $__wasm_nullptr $_ZN10privileged9print_str17hc7b3bc9f45422b51E $_ZN4core3ptr13drop_in_place17h075f9de043c465dbE $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h845b11d78413200aE $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h21fa3d6e92f34193E $_ZN4core3ptr13drop_in_place17ha364d4008367b191E $_ZN102_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$LT$$u27$a$GT$$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h96d8f0e8b44ee985E $_ZN102_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$LT$$u27$a$GT$$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h1bf855028006d072E $_ZN4core3ptr13drop_in_place17h075f9de043c465dbE.17)
  (data (i32.const 4) "\10\05\10\00")
  (data (i32.const 12) "\02\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\04\00\00\00")
  (data (i32.const 32) "\05\00\00\00\04\00\00\00\04\00\00\00\06\00\00\00\07\00\00\00")
  (data (i32.const 64) "\08\00\00\00\00\00\00\00\01\00\00\00\03\00\00\00\04\00\00\00")
  (data (i32.const 84) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (i32.const 1120) "env")
  (data (i32.const 1136) "print_str")
  (data (i32.const 1152) "sandboxed/sandboxed.wasm")
  (data (i32.const 1184) "entrypoint")
  (data (i32.const 1200) "memory")
  (data (i32.const 1208) "\d0\04\00\00\11\00\00\00\f0\04\00\00\13\00\00\00\ca\02\00\00\09\00\00\00")
  (data (i32.const 1232) "capacity overflow")
  (data (i32.const 1264) "liballoc/raw_vec.rs"))
