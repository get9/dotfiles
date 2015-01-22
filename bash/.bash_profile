# Prompt
export PS1="[\t] \u:\w\n$ "
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=GxFxCxDxBxegedabagaced

# Platform detection
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    platform='linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='macosx'
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    platform='cygwin'
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    platform='msys'
elif [[ "$OSTYPE" == "win32" ]]; then
    # Probably not gonna happen
    platform='win32'
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    platform='freebsd'
fi

if [[ "$platform" == "macosx" ]]; then
    # Brew tab-completion
    source "$(brew --prefix grc)/etc/grc.bashrc"
    source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

    # git tab-completion
    source /usr/local/etc/bash_completion.d/git-completion.bash

    # Ruby gems
    export PATH=/usr/local/opt/ruby/bin:$PATH
    
    # Android platform tools (adb, etc)
    export PATH=$HOME/wa/android/bin:$PATH
    
    # Misc stuff
    export PATH=/usr/local/bin:$PATH
fi

# Personal scripts
export PATH=$HOME/bin:$PATH

# Aliases
alias l='ls -lh'
alias ll='ls -alh'
alias u='cd ..'
alias c='clear'
alias clang='clang -Weverything'
