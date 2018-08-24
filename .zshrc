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

source $ZSH/oh-my-zsh.sh

set -o vi
alias vi="vim"
alias view="vim -M"

source /usr/bin/virtualenvwrapper.sh

[[ -f ~/.startx.sh ]] && source ~/.startx.sh || tmux_entrypoint

export DOCKER_UID=$UID
export DOCKER_GID=$GID
