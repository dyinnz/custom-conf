#!/bin/bash
set -x

CURR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOT="$(dirname $CURR)"
echo $ROOT

ln -s $HOME/.local/share/nvim/site/autoload/plug.vim $HOME/package/plug.vim

unzip $ROOT/package/ycm.zip -d $HOME/.vim/

unzip $ROOT/package/oh-my-zsh.zip -d $ROOT
mv $ROOT/ohmy-zsh-master $HOME/.oh-my-zsh

unzip $ROOT/package/zsh-autosuggestions.zip -d $ROOT
mv $ROOT/zsh-autosuggestions-master $HOME/.oh-my-zsh/plugins/zsh-autosuggestions
