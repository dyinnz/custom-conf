export TERM=screen-256color

if [ "$(uname -s)" = "Linux" ]; then
    export LOCAL_PATH=$HOME/local
else
    export LOCAL_PATH=$HOME/Local
fi

export C_INCLUDE_PATH=$LOCAL_PATH/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$LOCAL_PATH/include:$CPLUS_INCLUDE_PATH

export LIBRARY_PATH=$LOCAL_PATH/lib:$LIBRARY_PATH
export LIBRARY_PATH=$LOCAL_PATH/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL_PATH/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL_PATH/lib64:$LD_LIBRARY_PATH

export PATH=$LOCAL_PATH/bin:$PATH

alias agcpp="ag --cpp"
