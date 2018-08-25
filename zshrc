# oh my zsh
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# common
source $HOME/.custom-conf/common-env.sh
source $HOME/.custom-conf/custom-env.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
