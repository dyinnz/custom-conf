#!/bin/bash

ROOT="$( cd "$(dirname "$0")" ; pwd -P )"

source $ROOT/link.sh

ln -s $HOME/.local/share/nvim/site/autoload/plug.vim $HOME/package/plug.vim

unzip $ROOT/package/ycm.zip -d $HOME/.vim/

unzip $ROOT/package/oh-my-zsh.zip -d $ROOT
mv $ROOT/oh-my-zsh-master $HOME/.oh-my-zsh

unzip $ROOT/package/zsh-autosuggestions.zip -d $ROOT
mv $ROOT/zsh-autosuggestions-master $HOME/.oh-my-zsh/plugins/zsh-autosuggestions

unzip $ROOT/package/brew.zip -d $ROOT
mv $ROOT/brew-master $HOME/.linuxbrew
