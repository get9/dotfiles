#!/usr/bin/env bash

set -eu

# Save on some shellouts
cur_dir=$(pwd)

# Did not bootstrap_link message
# @1: file to display in message
function did_not_link() {
    file="$1"
    echo "Did not bootstrap_link $file, already exists"
}

# Function to bootstrap_link $1 --> $2
# Expected that $src is relative to $PWD
function bootstrap_link() {
    src="$1"
    dest="$2"
    echo "$src --> $dest"

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
bootstrap_link "$cur_dir/bash/man_colors.sh" "$HOME/.man_colors"
bootstrap_link "$cur_dir/bash/alias_common.sh" "$HOME/.alias_common"
bootstrap_link "$cur_dir/bash/bash_common.sh" "$HOME/.bash_common"
bootstrap_link "$cur_dir/clang-format" "$HOME/.clang-format"
bootstrap_link "$cur_dir/tmux.conf" "$HOME/.tmux.conf"
bootstrap_link "$cur_dir/bin/" "$HOME/bin"

# Vim
echo "Linking vim files"
bootstrap_link "$cur_dir/vim/vimrc" "$HOME/.vimrc"
bootstrap_link "$cur_dir/vim/vim" "$HOME/.vim"

# bootstrap_link platform-specific profiles
echo "Linking for: $platform"
if [[ "$platform" == "linux" ]]; then
    source "$cur_dir/bootstrap_linux.sh"
elif [[ "$platform" == "macos" ]]; then
    source "$cur_dir/bootstrap_macos.sh"
fi
