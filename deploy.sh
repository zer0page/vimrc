#!/usr/bin/env bash
set -e
sudo apt-get install -y vim-gtk cscope exuberant-ctags
VUNDLE_DIR="$HOME/.vim/bundle/vundle"
if [ ! -d "$VUNDLE_DIR" ];then
    echo "Cloning Vundle"
    git clone http://github.com/gmarik/vundle.git "$VUNDLE_DIR"
fi
cp vimrc ~/.vimrc
vim +BundleInstall +GoInstallBinaries +qall
