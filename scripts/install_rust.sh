#!/usr/bin/env bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash

rustup toolchain add nightly
rustup default nightly

rustup component add rust-src rustc-dev llvm-tools-preview clippy-preview
