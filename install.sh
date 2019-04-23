#!/bin/sh
if [ -f "~/.vimrc" ]; then
    cp "~/.vimrc" "~/.vimrc.back"
fi
if [ ! -d "~/.vim/bundle"]; then
    mkdir "~/.vim/bundle"
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/xavierchan/xx-vim/master/.vimrc -O ~/.vimrc
