export PATH=$HOME/bin:/usr/local/bin:$PATH
# ZSH Config
export ZSH="/Users/prondeau/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git docker node npm python tmux)
source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.zsh_aliases
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export TERM=xterm-256color
