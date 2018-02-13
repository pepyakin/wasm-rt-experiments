# Description

This is an experiment for organizing sandboxed execution of the wasm code 
sharing the same underlying execution engine.

# Example

Privileged wasm module that can create sandboxes:

```rust

// ...

#[no_mangle]
pub fn entrypoint() {
    let mut sandbox = Sandbox::new();
    sandbox.register_func2("env", "print_str", print_str);

    let instance = sandbox.instantiate("sandboxed/sandboxed.wasm");
    instance.invoke("entrypoint");
}

```

Sanboxed module:

```rust

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

```

That way we can even create nested sandboxes!
