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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/parondeau/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/parondeau/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/parondeau/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/parondeau/google-cloud-sdk/completion.zsh.inc'; fi

# NVM CONFIG #
export NVM_DIR=$HOME/.nvm
. "/usr/local/opt/nvm/nvm.sh"
