#!/bin/bash

set -e

command -v wasm2wat &> /dev/null || ( echo "wasm2wat should be on PATH"; exit 1 )
command -v wat2wasm &> /dev/null || ( echo "wat2wasm should be on PATH"; exit 1 )

pushd .
cd privileged
./build.sh
popd

pushd .
cd sandboxed
./build.sh
popd
