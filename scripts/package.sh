#!/bin/bash
set -e
set -x

DIR=$HOME/workspace/custom-packages
mkdir -p $DIR && cd $DIR

wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
wget -O tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b-x86_64.AppImage

cd $HOME
tar czf $DIR/custom-conf.tar.gz .custom-conf
tar czf $DIR/oh-my-zsh.tar.gz .oh-my-zsh
tar czf $DIR/vim.tar.gz .vim

echo end
