# Get a nice prompt
export PS1="[\t] \u@\h:\w\n$ "

# Personal scripts
export PATH=$HOME/bin:$PATH

# Look for man pages in /usr/local/man first
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
source $HOME/.man_colors

# Let's use vim for things
export EDITOR=vim

# More prompt stuff
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=GxFxCxDxBxegedabagaced
