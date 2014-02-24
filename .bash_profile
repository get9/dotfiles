# Prompt
export PS1="[\t] \u:\w\n$ "
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
source "`brew --prefix grc`/etc/grc.bashrc"
export LSCOLORS=GxFxCxDxBxegedabagaced

# Brew tab-completion
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# git tab-completion
source /usr/local/etc/bash_completion.d/git-completion.bash

# Ruby gems
export PATH=/usr/local/opt/ruby/bin:$PATH

# Android platform tools (adb, etc)
export PATH=/Users/skarlage/wa/android/bin:$PATH

# Misc stuff
export PATH=/usr/local/bin:$PATH

# Personal scripts
export PATH=/Users/skarlage/bin:$PATH

# Aliases
alias l='ls -lh'
alias ll='ls -alh'
alias u='cd ..'
alias c='clear'
alias clang='clang -Weverything'
