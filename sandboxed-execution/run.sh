#!/bin/bash

set -eux

command -v node &> /dev/null || ( echo "node should be on PATH"; exit 1 )

node main.js
