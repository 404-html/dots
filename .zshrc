export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  sudo
  git
  docker
  docker-comose
  docker-container
)

DISABLE_AUTO_UPDATE="true"

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh || echo "Oh my ZSH not found!"

set -o vi
alias vi="vim"
alias view="vim -M"

[[ -f /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh

[[ -f ~/.startx.sh ]] && source ~/.startx.sh || tmux_entrypoint
