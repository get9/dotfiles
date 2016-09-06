# Any specific things
if [ -f $HOME/.specific_mac ]; then
  source $HOME/.specific_mac
fi

# Check if brew is even installed
if hash brew 2>/dev/null; then
    # Brew tab-completion
    source "$(brew --prefix)/etc/grc.bashrc"
    source "$(brew --prefix)/etc/bash_completion"
fi

# Find homebrew stuff first stuff
export PATH=/usr/local/bin:$PATH

# LaTeX programs
export PATH=/usr/texbin:$PATH

# Homebrew make -j value
export HOMEBREW_MAKE_JOBS=4

# Aliases
source $HOME/.aliases_common
source $HOME/.aliases_mac

# Common bashrc things
source $HOME/.bashrc_common
