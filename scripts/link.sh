#!/bin/bash
set -x

CURR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOT="$(dirname $CURR)"
echo $ROOT

# always works
mkdir -p $HOME/.vim

ln -s $ROOT/zshrc $HOME/.zshrc
ln -s $ROOT/tmux.conf $HOME/.tmux.conf

ln -s $ROOT/nvim $HOME/.config/nvim
ln -s $ROOT/python/pycodestyle $HOME/.config/pycodestyle

