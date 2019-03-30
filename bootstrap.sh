#!/usr/bin/env bash

set -eu

# Save on some shellouts
pwd=$(pwd)

force=0
while getopts ":f" opt; do
    case "$opt" in
        f) force=1
        ;;
    esac
done

# Did not bootstrap_link message
# @1: file to display in message
function did_not_link() {
    local file="$1"
    echo "Did not bootstrap_link $file, already exists"
}

# Function to bootstrap_link $1 --> $2
# Expected that $src is relative to $PWD
function bootstrap_link() {
    local src="$1"
    local dest="$2"
    echo "$src --> $dest"

    # force link
    if [[ "$force" == 1 ]]; then
        rm "$dest"
    fi

    # Different behavior depending on whether $src is a file or dir
    if [[ -f "$dest" || -d "$dest" || -L "$dest" ]]; then
        did_not_link "$src"
    else
        ln -s "$src" "$dest"
    fi
}

# Platform detection
# From: http://stackoverflow.com/a/394247
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    platform='linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='macos'
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

# Common files
echo "Linking common files"
bootstrap_link "$pwd/bash/man_colors.sh" "$HOME/.man_colors"
bootstrap_link "$pwd/bash/alias_common.sh" "$HOME/.alias_common"
bootstrap_link "$pwd/bash/bash_common.sh" "$HOME/.bash_common"
bootstrap_link "$pwd/clang-format" "$HOME/.clang-format"
bootstrap_link "$pwd/tmux.conf" "$HOME/.tmux.conf"

# Vim
echo "Linking vim files"
bootstrap_link "$pwd/vim/vimrc" "$HOME/.vimrc"
if [[ ! -d "$HOME/.vim/backup" ]]; then
    echo "Creating .vim/backup"
    mkdir -p "$HOME/.vim/backup"
fi
if [[ ! -d "$HOME/.vim/swp" ]]; then
    echo "Creating .vim/swp"
    mkdir -p "$HOME/.vim/swp"
fi

# Add vim-plug if needed
if [[ ! -f "$HOME/.vim/autoload/plug.vim" ]]; then
    echo "Downloading vim-plug"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
      "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
fi


# bootstrap_link platform-specific profiles
echo "Linking for: $platform"
if [[ "$platform" == "linux" ]]; then
    source "$pwd/bootstrap_linux.sh"
elif [[ "$platform" == "macos" ]]; then
    source "$pwd/bootstrap_macos.sh"
fi
