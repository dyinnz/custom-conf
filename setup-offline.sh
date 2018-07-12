#!/bin/bash

ROOT=$(pwd)

# -----------------------------------------------------------------------------
# tmux
ln -s $ROOT/tmux.conf ~/.tmux.conf

# -----------------------------------------------------------------------------
# vim
mkdir -p ~/local
tar zxf ./package/nvim.tar.gz
mv nvim-linux64 ~/local/nvim

mkdir -p ~/.vim
ln -s $ROOT/vimrc ~/.vim/vimrc
mkdir -p ~/.config/nvim
ln -s $ROOT/vimrc ~/.config/nvim/init.vim

mkdir -p ~/.vim/autoload
cp ./package/plug.vim ~/.vim/autoload/plug.vim
mkdir -p ~/.local/share/nvim/site/autoload
cp ./package/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

# ycm_extra_conf
ln -s $ROOT/ycm_extra_conf.py ~/.vim/ycm_extra_conf.py
unzip ./package/ycm.zip -d ~/.vim/

# -----------------------------------------------------------------------------
# oh my zsh
ln -s $ROOT/zshrc ~/.zshrc

unzip ./package/oh-my-zsh.zip
mv ./oh-my-zsh-master ~/.oh-my-zsh

unzip ./package/zsh-autosuggestions.zip
mv ./zsh-autosuggestions-master ~/.oh-my-zsh/plugins/zsh-autosuggestions

# -----------------------------------------------------------------------------
# oh my zsh
unzip ./package/brew.zip
mv ./brew-master ~/.linuxbrew
