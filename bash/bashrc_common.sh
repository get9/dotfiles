# Get a nice prompt
export PS1="[\t] \u@\h:\w\n$ "

# Prevent anything from creating output that breaks utilities that use ssh as a
# pipe
[ -z "$PS1" ] && return

# Look for man pages in /usr/local/man first
export MANPATH=/usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
source $HOME/.man_colors

# Personal scripts
export PATH=$HOME/bin:$PATH
