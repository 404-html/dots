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

man() {
  LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
  }

export EDITOR=vim
export VISUAL=vim

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
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

set -o vi
alias vi="vim"
alias view="vim -M"

[[ -f /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh

[[ -f ~/.startx.sh ]] && source ~/.startx.sh || tmux_entrypoint
