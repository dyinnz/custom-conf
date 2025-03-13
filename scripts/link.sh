#!/bin/bash
set -x

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PROJECT_DIR="$(dirname $SCRIPT_DIR)"

rm $HOME/.zshrc && ln -s $PROJECT_DIR/zshrc $HOME/.zshrc
rm $HOME/.tmux.conf && ln -s $PROJECT_DIR/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config
ln -s $PROJECT_DIR/nvim $HOME/.config/nvim

# c++
mkdir -p $HOME/.ccache
rm $HOME/.ccache/ccache.conf && ln -s $PROJECT_DIR/cpp/ccache.conf $HOME/.ccache/ccache.conf
rm $HOME/.clang-tidy && ln -s $PROJECT_DIR/cpp/clang-tidy.yaml $HOME/.clang-tidy

# python
pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
