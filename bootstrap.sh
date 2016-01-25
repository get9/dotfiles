#!/usr/bin/env bash

# Determine platform to set appropriate vars
# From: http://stackoverflow.com/a/394247
# Platform detection
platform='unknown'
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    platform='linux'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform='macosx'
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

# Link platform-specific profiles
echo "Linking for: $platform"
if [[ "$platform" == "linux" ]]; then
    if [ ! -f $HOME/.bashrc ]; then
        ln -s $(pwd)/bash/bashrc_linux.sh $HOME/.bashrc
        ln -s $(pwd)/bash/bash_aliases_linux.sh $HOME/.bash_aliases_linux
    fi
elif [[ "$platform" == "macosx" ]]; then
    if [ ! -f $HOME/.bash_profile ]; then
        ln -s $(pwd)/bash/bashrc_mac.sh $HOME/.bash_profile
        ln -s $(pwd)/bash/bash_aliases_mac.sh $HOME/.bash_aliases_mac
    fi
fi

# Link common files
if [ ! -f ~/.man_colors ]; then
    echo "Linking .man_colors.sh"
    ln -s $(pwd)/bash/man_colors.sh $HOME/.man_colors
fi
if [ ! -f ~/.bash_aliases_common ]; then
    ln -s $(pwd)/bash/bash_aliases_common.sh $HOME/.bash_aliases_common
fi

# vim stuff
if [ ! -f ~/.vimrc ]; then
    echo "Linking .vimrc"
    ln -s "$(pwd)/vim/vimrc" "$HOME/.vimrc"
fi
if [ ! -d ~/.vim ]; then
    echo "Linking .vim directory"
    ln -s "$(pwd)/vim/vim" "$HOME/.vim"
fi

# bin/ - filled with useful tools.
if [ ! -d ~/bin ]; then
    echo "Linking bin directory"
    ln -s "$(pwd)/bin" "$HOME/bin"
fi

# misc stuff
if [ ! -f ~/.clang-format ]; then
    echo "Linking clang-format"
    ln -s "$(pwd)/clang-format" "$HOME/.clang-format"
fi
