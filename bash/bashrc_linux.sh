# Enable bash autocompletion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Everything that's common to all platforms
export PS1="[\t] \u@\h:\w\n$ "

# Look for man pages in /usr/local/man first
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
source $HOME/.man_colors

# Personal scripts
export PATH=$HOME/bin:$PATH

# Aliases
source ~/.bash_aliases_common
source ~/.bash_aliases_linux
