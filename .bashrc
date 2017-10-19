export PATH="$PATH:/vidyard/depot_tools"

export NVM_DIR="$HOME/.nvm"

export PS1="\W $ "

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

set -o vi

source /vidyard/DevTools/.vidyard_bashrc

alias ssh-aws='ssh -i ~/.ssh/id_rsa -l adfs-production-davecollie'

source $(brew --prefix nvm)/nvm.sh
