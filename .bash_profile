# LOCALE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BASH_SILENCE_DEPRECATION_WARNING=1
export KUBECONFIG=${HOME}/.config/kubectl/admin.conf
#alias terraform=tofu

# Aliases
alias ll='ls -laF'
alias upgrade_all="brew update && brew upgrade && brew cu --yes --all --cleanup && brew cleanup"
alias docker=podman
alias vim=nvim
alias kubectl='kubectl --insecure-skip-tls-verify'
alias python=/opt/homebrew/bin/python3
alias python3=/opt/homebrew/bin/python3
alias sandbox-no-network='/usr/bin/sandbox-exec -p "(version 1)(allow default)(deny network*)"'

# PATH
export PATH="${PATH}:/usr/local/bin:${HOME}/.local/bin:/opt/homebrew/bin:/opt/homebrew/opt/gnu-tar/libexec/gnubin:/opt/homebrew/opt/gnu-sed/libexec/gnubin"

open_webui() {
  docker start open-webui
  open http://127.0.0.1:3000
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cool stuff for bash
# Enable the git bash completion commands
source /opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh
source /opt/homebrew/etc/bash_completion

test -f ~/.git-completion.bash && . $_

# Colours!
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\n${MAGENTA}[\w${GREEN}$(__git_ps1)${MAGENTA}]\n${CYAN}\u$ '
