#!/bin/bash

set -x

cargo install --version 0.63.0 bindgen-cli --root /tmp/caliptra-bindgen

/tmp/caliptra-bindgen/bin/bindgen \
    --with-derive-default \
    --no-layout-tests \
    --disable-header-comment \
    --raw-line="/*++" \
    --raw-line="Licensed under the Apache-2.0 license." \
    --raw-line="--*/" \
    --raw-line="" \
    --raw-line="// generated by src/integration/verilated/generate_rust_bindings.sh" \
    --allowlist-file=caliptra_verilated.h \
    caliptra_verilated.h \
    -o src/bindings/real.rs
