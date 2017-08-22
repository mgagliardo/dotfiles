# Just LOCALE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ll='ls -laF'
alias whatsmyip='curl -s http://whatismyip.akamai.com/'

# Gopath
GOROOT="/usr/local/go"
GOPATH="$HOME/.go"

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Mypath
PATH="$PATH:/usr/local/bin:/usr/local/go/bin:/opt/hashicorp:/opt/groovy/bin:/opt/grails/grails-2.4.4/bin/:/opt/node/bin:$GOROOT/bin:$HOME/Scripts"

# Cool stuff for bash
# Enable the git bash completion commands
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

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
