#!/bin/bash

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"

# always works
mkdir -p $HOME/.vim
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/yapf

ln -s $ROOT/zshrc $HOME/.zshrc
ln -s $ROOT/tmux.conf $HOME/.tmux.conf

ln -s $ROOT/vimrc $HOME/.vim/vimrc
ln -s $ROOT/vimrc $HOME/.config/nvim/init.vim
ln -s $ROOT/ycm_extra_conf.py $HOME/.vim/ycm_extra_conf.py

ln -s $ROOT/flake8 $HOME/.config/flake8
ln -s $ROOT/yapf.style $HOME/.config/yapf/style
