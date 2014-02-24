#!/usr/bin/env bash

# .bash_profile
if [ ! -L ~/.bash_profile ]
then
    echo "Linking .bash_profile"
    ln -s `pwd`/bash/.bash_profile ~
fi

# vim stuff
if [ ! -L ~/.vimrc ]
then
    echo "Linking .vimrc"
    ln -s `pwd`/vim/.vimrc ~
fi
if [ ! -L ~/.vim ]
then
    echo "Linking .vim directory"
    ln -s `pwd`/vim/.vim ~
fi

# bin/ - filled with useful tools.
if [ ! -L ~/bin ]
then
    echo "Linking bin directory"
    ln -s `pwd`/bin ~
fi

# Taking care of $PATH
echo "Adding ~/bin to \$PATH"
export PATH=~/bin:$PATH
echo "\$PATH=$PATH"
