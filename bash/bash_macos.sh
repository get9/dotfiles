# Pre script 
if [[ -f "$HOME/.bash_pre" ]]; then
    source "$HOME/.bash_pre"
fi

# Assume bootstrap setup brew. Source for bash tab-completion
source "$(brew --prefix)/etc/grc.bashrc"
source "$(brew --prefix)/etc/bash_completion"

# Homebrew make -j value - set to correct # cores
export HOMEBREW_MAKE_JOBS=$(sysctl -n hw.ncpu)

# Find homebrew stuff before things in /usr/bin
export PATH=/usr/local/bin:$PATH

# Aliases
source "$HOME/.alias_common"
source "$HOME/.alias_macos"

# Common bash things
source "$HOME/.bash_common"

# Post script
if [[ -f "$HOME/.bash_post" ]]; then
    source "$HOME/.bash_post"
fi
