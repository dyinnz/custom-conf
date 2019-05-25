# ------------------------------------------------------------------------------
# oh my zsh
export ZSH=$HOME/.oh-my-zsh

if [ "$(uname -s)" = "Linux" ]; then
    ZSH_THEME="avit"
    export TERM=screen-256color
else
    ZSH_THEME="bureau"
    export TERM=xterm-256color
fi

plugins=(
  git
  z
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

source $HOME/.custom-conf/common-env.sh
[ -f "$HOME/.custom-conf/custom-env.sh" ] && source $HOME/.custom-conf/custom-env.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
