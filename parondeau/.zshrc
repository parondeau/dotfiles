############### ZSH CONFIG ###############
export PATH=/usr/bin:/usr/local/bin:/Users/parondeau/Library/Python/2.7/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/Users/parondeau/.oh-my-zsh
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git brew docker node npm python tmux)
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='vim'

############ POWERLINE CONFIG ############# 
. /Users/parondeau/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

export TERM=xterm-256color
