# Check if brew is even installed
if hash brew 2>/dev/null; then
    # Brew tab-completion
    source "$(brew --prefix)/etc/grc.bashrc"
    source "$(brew --prefix)/etc/bash_completion"
fi

# Ruby gems
export PATH=/usr/local/opt/ruby/bin:$PATH

# Misc stuff
export PATH=/usr/local/bin:$PATH

# Go stuff
export GOPATH=$HOME/wa/go

# More prompt stuff
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=GxFxCxDxBxegedabagaced

# LaTeX programs
export PATH=/usr/texbin:$PATH

# Homebrew make -j value
export HOMEBREW_MAKE_JOBS=4

# Beast IP
export BEASTIP=172.31.40.190
beastmode() { ssh -Y beast; }

# Everything that's common to all platforms
export PS1="[\t] \u@\h:\w\n$ "

# Look for man pages in /usr/local/man first
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
source $HOME/.man_colors

# Personal scripts
export PATH=$HOME/bin:$PATH

# GOROOT
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Scala + Intellij IDEA
export SCALA_HOME=/usr/local/opt/scala/idea

# Aliases
source ~/.bash_aliases_common
source ~/.bash_aliases_mac
