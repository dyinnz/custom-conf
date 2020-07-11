case "$1" in
    zsh_theme)
        if [ "$(uname -s)" = "Linux" ]; then
            ZSH_THEME="avit"
        else
            ZSH_THEME="bureau"
        fi
        ;;

    pre)
        LOCAL_PATH=$HOME/local
        export PATH=/usr/local/bin:$PATH
        export PATH=$LOCAL_PATH/bin:$PATH
        export C_PATH=$LOCAL_PATH/include:$C_PATH
        export LIBRARY_PATH=$LOCAL_PATH/lib:$LIBRARY_PATH
        export LIBRARY_PATH=$LOCAL_PATH/lib64:$LIBRARY_PATH
        export LD_LIBRARY_PATH=$LOCAL_PATH/lib:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH=$LOCAL_PATH/lib64:$LD_LIBRARY_PATH

        export TERM=xterm-256color
        ;;

    post)
        alias tree="tree -C"
        alias xargs_pssh="xargs -0 -I {} pssh -H '{}' "
        alias agcpp="ag --cpp"
        alias rmcmake="rm -r CMakeFiles CMakeCache.txt cmake_install.cmake"
        alias aria2c="aria2c -j 8"
        alias trn="tr '\n' ' '"
        [ -x "$(command -v nvim)" ] && alias vim=nvim && alias vimdiff="vim -d"
        ;;

    *)
        echo "hello world"
        ;;
esac
