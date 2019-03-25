export PATH=$HOME/bin:/usr/local/bin:$PATH
# custom homebrew path
export PATH=$HOME/homebrew/bin:$PATH

# ZSH Config
export ZSH="/Users/prondeau/.oh-my-zsh"
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
source "/Users/prondeau/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/Users/prondeau/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

