const fs = require('fs');
const buffer = fs.readFileSync('closure_alloc.wasm');
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

// This is supposed to be [byte] -> [byte] key-value storage.
let storage = {};
storage["hello"] = "world";

let imports = {};
imports.env = {
    "debug": function(msg_data, msg_len) {
        let str = copystr(msg_data, msg_len);
        console.log("debug =", str);
    },
    "ext_load_storage": function(key_ptr, key_len, cb_index, cb_data) {
        if (table == null) {
            throw 'table is null';
        }
        if (memory == null) {
            throw 'memory is null';
        }

        let key = copystr(key_ptr, key_len);
        let callback_func = table.get(cb_index);

        // 1. load storage value by key.
        let value = storage[key];

        // 2. invoke callback to get output pointer
        // NB: strings in JS are UTF-16!
        let value_size = value.length;
        let out_value_ptr = callback_func(cb_data, value_size);

        // 3. copy result value back into wasm memory.
        let u8_mem_view = new Uint8Array(memory.buffer);
        for (var i = 0; i < value_size; i++) {
            u8_mem_view[out_value_ptr + i] = value.charCodeAt(i)
        }
    },
};

let instance = new WebAssembly.Instance(m, imports);
table = instance.exports.table;
memory = instance.exports.memory;
instance.exports.entrypoint();
