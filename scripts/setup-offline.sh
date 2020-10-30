#!/bin/bash
set -x

CURR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
ROOT="$(dirname $CURR)"
cd .

ln -s $HOME/.local/share/nvim/site/autoload/plug.vim $HOME/package/plug.vim

unzip ./package/ycm.zip -d $HOME/.vim/

unzip ./package/oh-my-zsh.zip
mv ./ohmyzsh-master $HOME/.oh-my-zsh

unzip ./package/zsh-autosuggestions.zip
mv ./zsh-autosuggestions-master $HOME/.oh-my-zsh/plugins/zsh-autosuggestions


# $HOME/local
mkdir -p $HOME/local

tar zxf package/nvim.tar.gz -C $HOME/local
mv $HOME/local/nvim-linux64 $HOME/local/nvim

chmod +x package/tmux.AppImage
package/tmux.AppImage --appimage-extract
mv squashfs-root $HOME/local/tmux-app
