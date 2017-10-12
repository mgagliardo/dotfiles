# LOCALE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ll='ls -laF'
alias upgrade_all='brew update && brew upgrade && brew cu -f -y -a'
alias whatsmyip='curl -s http://whatismyip.akamai.com/'
alias python=/usr/local/bin/python2.7

# Gopath
GOPATH="$HOME/.go"

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# $PATH
PATH="$PATH:/usr/local/opt/go/libexec/bin:/usr/local/bin:$HOME/.minimesos/bin"

# Python 3
VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs

# Cool stuff for bash
# Enable the git bash completion commands
source /usr/local/opt/bash-git-prompt/share/gitprompt.sh
source /usr/local/etc/bash_completion

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
