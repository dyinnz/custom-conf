# ------------------------------------------------------------------------------
# oh my zsh
export ZSH=$HOME/.oh-my-zsh

# set zsh theme early
if [ "$(uname -s)" = "Linux" ]; then
    ZSH_THEME="avit"
else
    ZSH_THEME="bureau"
fi

plugins=(
  git
  z
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# ------------------------------------------------------------------------------
# zsh history
export HISTSIZE=100000
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# ------------------------------------------------------------------------------
# export TERM=xterm-256color


# env
LOCAL=$HOME/local
export PATH=$LOCAL/bin:$PATH

export BAT_THEME="TwoDark"
export FZF_PREVIEW_PREVIEW_BAT_THEME=$BAT_THEME

case "$(uname -s)" in
  Linux)
    export TERM=xterm-256color
    # root path
    export PATH=/usr/local/bin:$PATH
    # tools path & alias
    [ -d $LOCAL/python3 ] && export PATH=$LOCAL/python3/bin:$PATH && export LD_LIBRARY_PATH=$LOCAL/python3/lib:$LD_LIBRARY_PATH
    [ -d $LOCAL/tmux ] && export PATH=$LOCAL/tmux/usr/bin:$PATH
    [ -d $LOCAL/nvim ] && alias nvim=$LOCAL/nvim/bin/nvim
    ;;

  Darwin)
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
    ;;
esac

# alias
[ -x "$(command -v nvim)" ] && alias vim=nvim && alias vimdiff="nvim -d"

alias tree="tree -C"
alias rmcmake="rm -r CMakeFiles CMakeCache.txt"
alias xargs_pssh="xargs -0 -I {} pssh -H '{}' "
alias xargs_keyscan="xargs ssh-keyscan >> $HOME/.ssh/known_hosts"

# custom
[ -f "$HOME/.custom-conf/custom-env.sh" ] && source $HOME/.custom-conf/custom-env.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
