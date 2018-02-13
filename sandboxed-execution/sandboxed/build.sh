#!/bin/bash

set -eux

command -v wasm2wat &> /dev/null || ( echo "wasm2wat is not installed"; exit 0 )

rm sandboxed.wat sandboxed.wasm || true

RUSTFLAGS="-g" cargo build --target=wasm32-unknown-unknown --release
cp target/wasm32-unknown-unknown/release/sandboxed.wasm sandboxed.wasm
wasm2wat \
    -o sandboxed.wat \
    -f \
    target/wasm32-unknown-unknown/release/sandboxed.wasm
