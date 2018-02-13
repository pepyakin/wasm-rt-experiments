#!/bin/bash

set -xe

rm closure_alloc.wat closure_alloc.wasm || true

# We need --release since debug version at the moment doesn't work properly.
RUSTFLAGS="-g" cargo build --release --target wasm32-unknown-unknown

command -v wasm2wat || ( echo "wasm2wat isn't installed"; exit 1 )
command -v wat2wasm || ( echo "wat2wasm isn't installed"; exit 1 )

# Copy closure_alloc.wasm to local directory
cp \
    target/wasm32-unknown-unknown/release/closure_alloc.wasm \
    ./closure_alloc.wasm

# 
wasm2wat \
    -f \
    ./closure_alloc.wasm |
    sed '1 a\
(export "table" (table 0))' > closure_alloc.wat
wat2wasm \
    --debug-names \
    -o ./closure_alloc.wasm \
    closure_alloc.wat
 
# To get estimate of size
wasm2wat ./closure_alloc.wasm | wc -l
