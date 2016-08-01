#! /usr/bin/env sh

# Get .vimrc
curl -sL https://raw.githubusercontent.com/iminoso/dotfiles/master/.vimrc > ~/.vimrc

# Install apt vim
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh

# Install NERDTree
apt-vim install -y https://github.com/scrooloose/nerdtree.git

source ~/.bash_profile
