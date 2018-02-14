const fs = require('fs');
const buffer = fs.readFileSync('js_ffi.legalized.with_getTempRet0.wasm');
let m = new WebAssembly.Module(buffer);

let instance = null;

let imports = {};
imports.env = {
    'runtime_returns_u64': function() {
        // Sets the high part in tempRet0 and returns the low part from the function.
        instance.exports.setTempRet0(0xFFEEDDCC);
        return 0x00112233;
    },
    'runtime_takes_u64': function(lo, hi) {
        // 0xFFEEDDCC_00112233
        console.assert(hi|0 === 0xFFEEDDCC);
        console.assert(lo|0 === 0x00112233);
    },
};

instance = new WebAssembly.Instance(m, imports);

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

// it expects a value 0x0123_4567_89AB_CDEF. 
// In the first argument low component of the u64 is passed 
// and in the second argument high component is passed.
// 
// If wrong number is passed here then wasm will trap.
instance.exports.takes_u64(0x89ABCDEF, 0x01234567);

// Invoke `test` function which will test `runtime_returns_u64` and `runtime_takes_u64`.
instance.exports.test();

console.log("Success!")
