# LOCALE
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases
alias ll='ls -laF'
alias upgrade_all='brew update && brew upgrade && brew cu --yes --all --cleanup'
alias whatsmyip='curl -s http://whatismyip.akamai.com/'

# Gopath
export GOPATH="$HOME/.go"

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Python3
alias python=$HOME/.miniconda3/bin/python3
export CONDA_HOME=$HOME/.miniconda3

# PATH
export PATH="$PATH:/usr/local/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:$GOPATH/pkg:$CONDA_HOME/bin"

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

# CONDA
__conda_setup="$('/Users/miguelgagliardo/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/miguelgagliardo/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/miguelgagliardo/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/miguelgagliardo/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
