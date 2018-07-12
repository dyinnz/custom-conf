#!/bin/bash

export PATH="$HOME/.linuxbrew/bin:$PATH"                                                                                                                                                 
export MANPATH="$(brew --prefix)/share/man:$MANPATH"                                                                                                                              
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH" 

brew install tmux
brew install zsh
brew install universal-tag
