if [ -f "~/.vimrc" ]; then
    cp ~/.vimrc ~/.vimrc.back
fi
if [ ! -d "~/.vim/bundle"]
    mkdir ~/.vim/bundle
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://github.com/xavierchan/xx-vim/blob/master/.vimrc -O ~/.vimrc
