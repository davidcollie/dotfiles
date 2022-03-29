export PS1="\W $ "

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

set -o vi

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
