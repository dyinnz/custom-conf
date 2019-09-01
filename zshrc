# ------------------------------------------------------------------------------
# oh my zsh
export ZSH=$HOME/.oh-my-zsh

# custom conf path
export CUSTOM_CONF=$HOME/.custom-conf
# set zsh theme early
source $CUSTOM_CONF/env-functions.sh zsh_theme

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

source $HOME/.custom-conf/env-functions.sh pre

[ -f "$HOME/.custom-conf/custom-env.sh" ] && source $HOME/.custom-conf/custom-env.sh

source $HOME/.custom-conf/env-functions.sh post

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
