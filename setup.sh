#!/bin/bash

ROOT=$(pwd)

# tmux
ln -s $ROOT/tmux.conf ~/.tmux.conf

# vim
mkdir -p ~/.vim
mkdir -p ~/.config/nvim
ln -s $ROOT/vimrc ~/.vim/vimrc
ln -s $ROOT/vimrc ~/.config/nvim/init.vim

# ycm_extra_conf
ln -s $ROOT/ycm_extra_conf.py ~/.vim/ycm_extra_conf.py

# vim plugin
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# oh my zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i -e s/robbyrussell/bureau/g ~/.zshrc
echo "" >> ~/.zshrc
echo "source $(pwd)/common-env.sh" >> ~/.zshrc

# zsh
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
sed -i -e "s/plugins=(git)/plugins=(git zsh-autosuggestions)/g" ~/.zshrc
