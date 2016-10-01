#!/usr/bin/env bash

set -eu

# Colors
BLUE="\[\033[0;34m\]"
LIGHT_BLUE="\[\033[1;34m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
RESET_COLOR="\[\033[0m\]""]"

# Save on some shellouts
cur_dir=$(pwd)

# Function to link $1 --> $2
# @1: src
# @2: dest
# Expected that $src is relative to $PWD
function link() {
    src="$1"
    dest="$2"
    echo "--> $src"

    # Different behavior depending on whether $src is a file or dir
    if [[ -f "$src" ]]; then
        if [[ ! -f "$HOME/$dest" ]]; then
            ln -s "$src" "$dest"
        else
            did_not_link("$src")
        fi
    elif [[ -d "$src" ]]; then
        if [[ ! -d "$HOME/$dest" ]]; then
            ln -s "$src" "$dest"
        else
            did_not_link("$src")
        fi
    fi
}

# Did not link message
function did_not_link() {
    file="$1"
    echo "$RED Did not link $file, already exists$RESET_COLOR"
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
link("bash/man_colors.sh", "$HOME/.man_colors")
link("bash/alias_common.sh", "$HOME/.alias_common")
link("bash/bash_common.sh", "$HOME/.bash_common")
link("clang-format", "$HOME/.clang-format")
link("tmux.conf", "$HOME/.tmux.conf")
link("bin/", "$HOME/bin")

# Vim
echo "Linking vim files"
link("vim/vimrc", "$HOME/.vimrc")
link("vim/vim", "$HOME/.vim")

# Link platform-specific profiles
echo "Linking for: $platform"
if [[ "$platform" == "linux" ]]; then
    source "$cur_dir/bootstrap_linux.sh"
elif [[ "$platform" == "macos" ]]; then
    source "$cur_dir/bootstrap_macos.sh"
fi
