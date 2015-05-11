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

# Mac-specific configuration.
if [[ "$platform" == "macosx" ]]; then
    # Check if brew is even installed
    if hash brew 2>/dev/null; then
        # Brew tab-completion
        source "$(brew --prefix grc)/etc/grc.bashrc"
        source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

        # git tab-completion
        source /usr/local/etc/bash_completion.d/git-completion.bash
    fi
    
    # Ruby gems
    export PATH=/usr/local/opt/ruby/bin:$PATH
    
    # Android platform tools (adb, etc)
    export PATH=$HOME/wa/android/bin:$PATH
    
    # Misc stuff
    export PATH=/usr/local/bin:$PATH

    # More prompt stuff
    export CLICOLOR=1
    export GREP_OPTIONS='--color=auto'
    export LSCOLORS=GxFxCxDxBxegedabagaced

    # LaTeX programs
    export PATH=/usr/texbin:$PATH

    # Beast IP
    export BEASTIP=172.31.40.154
    beastmode() { ssh -Y skarlage@$BEASTIP; }

    # Mac-specific aliases
    alias fix_camera='sudo killall VDCAssistant'
    alias fix_audio='sudo killall coreaudiod'

# Linux-specific configuration
elif [[ "$platform" == "linux" ]]; then
    # Linux-specific aliases
    alias ls='ls --color=auto -pF'
fi

# Everything that's common to all platforms
export PS1="[\t] \u@\h:\w\n$ "

# Personal scripts
export PATH=$HOME/bin:$PATH

# Aliases
alias l='ls -lh'
alias ll='ls -alh'
alias u='cd ..'
alias c='clear'
