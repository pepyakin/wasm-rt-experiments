#!/bin/bash

set -eux

rm privileged.wat privileged.wasm || true

RUSTFLAGS="-g" cargo build --target=wasm32-unknown-unknown --release
wasm2wat \
    -f \
    target/wasm32-unknown-unknown/release/privileged.wasm |
    sed '1 a\
(export "table" (table 0))' > privileged.wat
wat2wasm \
    --debug-names \
    -o privileged.wasm \
    privileged.wat
