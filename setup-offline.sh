#!/bin/bash

ROOT=$(pwd)

# -----------------------------------------------------------------------------
# tmux
ln -s $ROOT/tmux.conf ~/.tmux.conf

# -----------------------------------------------------------------------------
# vim
mkdir -p ~/local/bin
cp ./package/nvim ~/local/bin

mkdir -p ~/.vim
ln -s $ROOT/vimrc ~/.vim/vimrc
mkdir -p ~/.config/nvim
ln -s $ROOT/vimrc ~/.config/nvim/init.vim

rsync ./package/plug.vim ~/.vim/autoload/plug.vim
rsync ./package/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

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
