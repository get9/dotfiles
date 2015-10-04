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

# .bash_profile
if [ ! -L ~/.bash_profile ]
then
    echo "Linking .bash_profile"
    if [[ "$platform" == "linux" ]]; then
        ln -s $(pwd)/bash/.bash_profile $HOME/.bashrc
    elif [[ "$platform" == "macosx" ]]; then
        ln -s $(pwd)/bash/.bash_profile $HOME/.bash_profile
    fi
fi
if [ ! -L ~/.man_colors.sh ]; then
    echo "Linking .man_colors.sh"
    ln -s $(pwd)/bash/man_colors.sh $HOME/.man_colors.sh
fi

# vim stuff
if [ ! -L ~/.vimrc ]
then
    echo "Linking .vimrc"
    ln -s "$(pwd)/vim/vimrc" "$HOME/.vimrc"
fi
if [ ! -L ~/.vim ]
then
    echo "Linking .vim directory"
    ln -s "$(pwd)/vim/vim" "$HOME/.vim"
fi

# bin/ - filled with useful tools.
if [ ! -L ~/bin ]
then
    echo "Linking bin directory"
    ln -s "$(pwd)/bin" "$HOME/bin"
fi

# Taking care of $PATH
echo "Adding ~/bin to \$PATH"
export PATH=~/bin:$PATH
echo "\$PATH=$PATH"
