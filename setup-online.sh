#!/bin/bash

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"

source $ROOT/link.sh

# pepare directories
mkdir -p $ROOT/package
mkdir -p $HOME/.local/share/nvim/site/autoload
mkdir -p $HOME/.vim/autoload

# vim-plug
curl -fLo $ROOT/package/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $ROOT/package/plug.vim $HOME/.local/share/nvim/site/autoload/plug.vim 
ln -s $ROOT/package/plug.vim $HOME/.vim/autoload/plug.vim

# oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
