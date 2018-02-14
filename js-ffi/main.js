const fs = require('fs');
const buffer = fs.readFileSync('js_ffi.legalized.with_getTempRet0.wasm');
let m = new WebAssembly.Module(buffer);

let imports = {};
imports.env = {
};

let instance = new WebAssembly.Instance(m, imports);

// If you see error:
//
// TypeError: invalid type
//
// then this means return_u64 actually returns u64, and no legalization
// has happened.
let lo = instance.exports.returns_u64();
let hi = instance.exports.getTempRet0();

console.assert(hi|0 === 0xDEADBEAF);
console.assert(lo|0 === 0xCAFEBABE);

console.log("Success!")
