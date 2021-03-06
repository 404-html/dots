unattached() {
  tmux ls -F "#{session_id}:#{?session_attached,yes,no}" | grep "no" | cut -d: -f1 | head -n1
}

tmux_entrypoint() {
  if command -v tmux > /dev/null; then
    if ps -o comm= $PPID | grep -vE "su" > /dev/null && [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
      unattached=$(unattached)
      if [ "$unattached" != "" ]; then
	tmux attach -t "$unattached" | grep "exited"
      else
	tmux new-session | grep "exited"
      fi
      [ "$?" = "0" ] && exit
    fi
  fi
}

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  sudo
  git
  docker
  docker-compose
  npm
  ng
  tmux
  zsh-syntax-highlighting
  dvc
)

DISABLE_AUTO_UPDATE="true"

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh || echo "Oh my ZSH not found!"

set -o vi
alias info="info --vi-keys"
alias dots='git --git-dir=$HOME/.dots.git/ --work-tree=$HOME'
alias dc='docker'
alias dcc='docker-compose'
alias dm='docker-machine'
dmenv() {
  eval $(docker-machine env $@)
}
alias dmenvu='eval $(docker-machine env -u)'

[[ -f /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh

[[ -f ~/.startx.sh ]] && source ~/.startx.sh || tmux_entrypoint
