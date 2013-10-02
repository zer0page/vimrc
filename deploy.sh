#!/usr/bin/env bash

VUNDLE_DIR="$HOME/.vim/bundle/vundle"
cp .vimrc ~/
if [ ! -d "{$VUNDLE_DIR}" ];then
    echo "Cloning Vundle"
    git clone http://github.com/gmarik/vundle.git "$VUNDLE_DIR"
    vim +BundleInstall +qa
fi
