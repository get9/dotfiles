# Any specific things first so we override them later
if [ -f $HOME/.bash_specific ]; then
    source $HOME/.bash_specific
fi

# Enable bash autocompletion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi

# Aliases
source $HOME/.aliases_common
source $HOME/.aliases_linux

# Common bashrc things
source $HOME/.bashrc_common
