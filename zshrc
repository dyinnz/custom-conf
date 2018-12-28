# ------------------------------------------------------------------------------
# oh my zsh
export ZSH=$HOME/.oh-my-zsh


if [ "$(uname -s)" = "Linux" ]; then
    ZSH_THEME="avit"
    LOCAL_PATH=$HOME/local
    export TERM=screen-256color
else
    ZSH_THEME="bureau"
    LOCAL_PATH=$HOME/local
    export TERM=xterm-256color
fi

plugins=(
  git
  z
  tmux
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# zsh history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# ------------------------------------------------------------------------------
# PATH

export C_INCLUDE_PATH=$LOCAL_PATH/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$LOCAL_PATH/include:$CPLUS_INCLUDE_PATH

export LIBRARY_PATH=$LOCAL_PATH/lib:$LIBRARY_PATH
export LIBRARY_PATH=$LOCAL_PATH/lib64:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL_PATH/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL_PATH/lib64:$LD_LIBRARY_PATH

export PATH=$LOCAL_PATH/bin:$PATH

# ------------------------------------------------------------------------------
# misc
alias agcpp="ag --cpp"

# custom
source $HOME/.custom-conf/custom-env.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
