#!/bin/bash

CURR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $CURR/..

mkdir -p tmp
mkdir -p package
cd package

wget -O plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &
wget -O oh-my-zsh.zip https://github.com/robbyrussell/oh-my-zsh/archive/master.zip &
wget -O zsh-autosuggestions.zip https://github.com/zsh-users/zsh-autosuggestions/archive/master.zip &
wget -O nvim.tar.gz https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz

git clone --recurse-submodules -j8 https://github.com/Valloric/YouCompleteMe.git ../tmp/YouCompleteMe
zip -r ycm.zip ../tmp/YouCompleteMe
