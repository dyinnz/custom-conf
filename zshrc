# oh my zsh
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bureau"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# custom
source $HOME/.custom-conf/common-env.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
