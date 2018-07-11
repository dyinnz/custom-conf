export TERM=screen-256color

# linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"                                                                                                                                                 
export MANPATH="$(brew --prefix)/share/man:$MANPATH"                                                                                                                              
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH" 

export C_INCLUDE_PATH=$HOME/local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$HOME/local/include:$CPLUS_INCLUDE_PATH

export LIBRARY_PATH=$HOME/local/lib:$LIBRARY_PATH
export LIBRARY_PATH=$HOME/local/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/lib64:$LD_LIBRARY_PATH

export PATH=$HOME/local/bin:$PATH

alias agcpp="ag --cpp"
