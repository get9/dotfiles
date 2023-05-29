# Pre script
[[ -f "$HOME/.bash_pre" ]] && source "$HOME/.bash_pre"

# Assume bootstrap setup brew. Source for bash tab-completion
if command -v brew 2>&1 >/dev/null; then
    source "$(brew --prefix)/etc/grc.sh"
    source "$(brew --prefix)/etc/bash_completion"
fi

# Find homebrew stuff before things in /usr/bin
export PATH=/Users/skarlage/bin:/usr/local/bin:$PATH

# Aliases
source "$HOME/.alias_common"
source "$HOME/.alias_macos"

# Common bash things
source "$HOME/.bash_common"

# Post script
[[ -f "$HOME/.bash_post" ]] && source "$HOME/.bash_post"
. "$HOME/.cargo/env"
