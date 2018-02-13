const fs = require('fs');

// Read `priveleged` module into the buffer.
const buffer = fs.readFileSync('privileged/privileged.wasm');

let m = new WebAssembly.Module(buffer);
let memory = null;
let table = null;

function copystr(a, b) {
    if (memory === null) {
        throw "memory is null";
    }
    let view = new Uint8Array(memory.buffer).slice(a, a + b);
    return String.fromCharCode.apply(null, view);
}

let sandboxes = [];
let imports = {};
let calling_sandbox_idx = null;
let calling_instance_idx = null;

imports.env = {
    "debug": function(msg_data, msg_len) {
        let str = copystr(msg_data, msg_len);
        console.log("debug =", str);
    },

    "sandbox_new": function() {
        let sandbox = {
            imports: {},
            instances: [],
        };
        let new_sandbox_idx = sandboxes.push(sandbox) - 1;
        return new_sandbox_idx;
    },
    "sandbox_register_func": function(sandbox_idx, module_name_data, module_name_len, field_name_data, field_name_len, func_idx) {
        let sandbox = sandboxes[sandbox_idx];
        let module_name = copystr(module_name_data, module_name_len);
        let field_name = copystr(field_name_data, field_name_len);

        let original_func = table.get(func_idx);

        sandbox.imports[module_name] = {};
        sandbox.imports[module_name][field_name] = original_func;
    },
    "sandbox_instantiate": function(sandbox_idx, filename_data, filename_len) {
        let sandbox = sandboxes[sandbox_idx];
        let filename = copystr(filename_data, filename_len);

        // Load module binary.
        let buffer = fs.readFileSync(filename);
        let module = new WebAssembly.Module(buffer);

        // Instantiate the module and register it in sandbox.
        let instance = new WebAssembly.Instance(
            module, 
            sandbox.imports
        );
        let instance_idx = sandbox.instances.push(instance) - 1;

        return instance_idx;
    },
    "sandbox_invoke": function(sandbox_idx, instance_idx, export_name_data, export_name_len) {
        // TODO: Support arguments
        let sandbox = sandboxes[sandbox_idx];
        let instance = sandbox.instances[instance_idx];
        let export_name = copystr(export_name_data, export_name_len);

        calling_sandbox_idx = sandbox_idx;
        calling_instance_idx = instance_idx;
        try {
            instance.exports[export_name]();
        } finally {
            calling_sandbox_idx = null;
            calling_instance_idx = null;
        }
    },
    "sandbox_peek_mem": function(sandbox_idx, instance_idx, memory_name_data, memory_name_len, local_ptr, remote_ptr, size) {
        let sandbox = sandboxes[sandbox_idx];
        let instance = sandbox.instances[instance_idx];
        let memory_name = copystr(memory_name_data, memory_name_len);
        
        // TODO: Check whether it is actually a memory
        let remote_memory = instance.exports[memory_name];
        let remote_view = new Uint8Array(remote_memory.buffer).slice(remote_ptr, remote_ptr + size);
        
        let local_view = new Uint8Array(memory.buffer);

        local_view.set(remote_view, local_ptr);
    },
    "sandbox_calling_sandbox": function() {
        return calling_sandbox_idx;
    },
    "sandbox_calling_instance": function() {
        return calling_instance_idx;
    },
};

let instance = new WebAssembly.Instance(m, imports);
table = instance.exports.table;
memory = instance.exports.memory;
instance.exports.entrypoint();