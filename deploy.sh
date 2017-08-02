#!/usr/bin/env bash

sudo apt-get install vim-gtk
set -e
VUNDLE_DIR="$HOME/.vim/bundle/vundle"
if [ ! -d "$VUNDLE_DIR" ];then
    echo "Cloning Vundle"
    git clone http://github.com/gmarik/vundle.git "$VUNDLE_DIR"
fi
cp vimrc ~/.vimrc
vim +BundleInstall +GoInstallBinaries +qall
