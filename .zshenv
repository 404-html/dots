export PATH=$PATH:$HOME/.node_modules/bin
export npm_config_prefix=$HOME/.node_modules

export TERM=xterm-256color
export EDITOR=vi
export VISUAL=vim

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export DIGITALOCEAN_ACCESS_TOKEN=$(< $HOME/.digitalocean_token) 2>/dev/null
export DIGITALOCEAN_IMAGE=coreos-stable
export DIGITALOCEAN_REGION=fra1
export DIGITALOCEAN_SSH_KEY_FINGERPRINT=$(ssh-keygen -l -E md5 -f .ssh/id_ecdsa.pylon_manager.pub \
					  | awk '{ gsub("MD5:", "", $2); print $2 }') 2>/dev/null
export DIGITALOCEAN_SSH_KEY_PATH=$HOME/.ssh/id_ecdsa.pylon_manager
export DIGITALOCEAN_SSH_PORT=22
export DIGITALOCEAN_SSH_USER=core
export SCALEWAY_REGION=ams1
export SCALEWAY_TOKEN=$(< $HOME/.scaleway_token) 2>/dev/null
export SCALEWAY_ORGANIZATION=$(< $HOME/.scaleway_organization) 2>/dev/null
