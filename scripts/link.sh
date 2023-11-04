#!/bin/bash

CURR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOT="$(dirname $CURR)"
echo $ROOT

# always works
mkdir -p $HOME/.vim
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

ln -s $ROOT/zshrc $HOME/.zshrc
ln -s $ROOT/tmux.conf $HOME/.tmux.conf

ln -s $ROOT/vimrc $HOME/.vim/vimrc
ln -s $ROOT/vimrc $HOME/.config/nvim/init.vim
ln -s $ROOT/coc-settings.json $HOME/.config/nvim/coc-settings.json
