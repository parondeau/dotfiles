export PATH=$HOME/bin:/usr/local/bin:$HOME/bin/flutter/bin:$PATH
export BREW_PATH=$(brew --prefix)

# ZSH Config
export ZSH="/Users/parondeau/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git docker kubectl node npm python tmux)
source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.zsh_aliases
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export TERM=xterm-256color

# gcloud
source "${BREW_PATH}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "${BREW_PATH}/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

