#!/bin/bash

set -x

SCRIPT_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PROJECT_DIR="$(dirname $SCRIPT_DIR)"
echo $PROJECT_DIR

# oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# pepare directories
mkdir -p $HOME/local/bin
mkdir -p $HOME/local/package
cd $HOME/local/package

curl -fsSL https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz -o nvim.tar.gz \
  && mkdir -p nvim && tar zxf nvim.tar.gz -C nvim --strip-components=1 && mv nvim $HOME/local

curl -fsSL https://github.com/junegunn/fzf/releases/download/v0.60.0/fzf-0.60.0-linux_amd64.tar.gz -o fzf.tar.gz \
  && tar zxf fzf.tar.gz && mv fzf $HOME/local/bin

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
