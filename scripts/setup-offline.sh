#!/bin/bash
set -x

DIR=$HOME/workspace/custom-packages
mkdir -p $DIR && cd $DIR

# $HOME/local
mkdir -p $HOME/local


tar xzf nvim.tar.gz -C $HOME/local
mv $HOME/local/nvim-linux64 $HOME/local/nvim

tar xzf tmux.tar.gz -C $HOME/local

mkdir -p $HOME/.old
mv $HOME/.custom-conf $HOME/.old/
mv $HOME/.vim $HOME/.old/
mv $HOME/.oh-my-zsh $HOME/.old/

tar xzf custom-conf.tar.gz -C $HOME/.custom-conf
tar xzf vim.tar.gz $HOME/.vim
tar xzf oh-my-zsh.tar.gz $HOME/.oh-my-zsh

echo end
