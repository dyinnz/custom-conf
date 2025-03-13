#!/bin/bash

apt install --no-install-recommends -y \
  zsh tmux git curl ripgrep fd-find openssh-client openssh-server \
  python3 python3.11-venv \
  cmake ninja-build ccache \
  libssl-dev

apt install --no-install-recommends -y \
  clang-16 libclang-rt-16-dev llvm-16 lld-16 clangd-16 clang-format-16 clang-tidy-16 lldb-16

apt install --no-install-recommends -y \
  clang-19 libclang-rt-19-dev llvm-19 lld-19 clangd-19 clang-format-19 clang-tidy-19 lldb-19
