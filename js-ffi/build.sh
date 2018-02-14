#!/bin/bash

set -xe

rm *.wat *.wast *.wasm || true

# We need --release since debug version at the moment doesn't work properly.
RUSTFLAGS="-g" cargo build --release --target wasm32-unknown-unknown

command -v wasm2wat || ( echo "wasm2wat isn't installed"; exit 1 )
command -v wat2wasm || ( echo "wat2wasm isn't installed"; exit 1 )
command -v wasm-opt || ( echo "wasm-opt isn't installed"; exit 1 )

# Copy js_ffi.wasm to local directory
cp \
    target/wasm32-unknown-unknown/release/js_ffi.wasm \
    ./js_ffi.wasm

# 
wasm2wat \
    -f \
    ./js_ffi.wasm \
    -o js_ffi.wat

# legalize js ffi
wasm-opt \
    --legalize-js-interface \
    -g \
    --emit-text js_ffi.wasm -o js_ffi.legalized.wat

cat js_ffi.legalized.wat |
    sed '1 a\
(func (export "getTempRet0") (result i32) (get_global $tempRet0))' > js_ffi.legalized.with_getTempRet0.wat

wat2wasm ./js_ffi.legalized.with_getTempRet0.wat -o ./js_ffi.legalized.with_getTempRet0.wasm

# wasm2wat \
#    -f \
#    ./js_ffi.legalized.wasm \
#    -o js_ffi.legalized.wat
