# Any preload things first
[[ -f "$HOME/.bash_pre" ]] && source "$HOME/.bash_pre"

# Common bashrc things
source "$HOME/.bash_common"

# Enable bash autocompletion in interactive shells
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        source /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        source /etc/bash_completion
    fi
fi

# Aliases
source $HOME/.alias_common
source $HOME/.alias_linux

# Postload things
[[ -f "$HOME/.bash_post" ]] && source "$HOME/.bash_post"
