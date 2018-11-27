" Configuration file for vim
 
 " ==== Base Settings ====
 set nocompatible
 set backspace=indent,eol,start
 set nu " 显示行号
 syntax on " 开启语法高亮
 set hlsearch " 高亮显示结果
 set ts=4 " tab四个空格
 set autoread " 当文件在外部修改时，Vim自动更新载入
 set showmatch
 "set ruler " 打开状态栏标尺
 set magic " 设置魔术
 " 折叠
 set foldmethod=indent
 set foldlevel=99
 " 突出显示当前列
 set cursorcolumn
 " 突出显示当前行
 set cursorline
 " 设置标记一列的背景颜色和数字一行颜色一致
 hi! link SignColumn   LineNr

 " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
 set scrolloff=7
 " Smart indent
set smartindent
set autoindent

" 设置Tab键的宽度        [等同的空格个数]
set tabstop=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set ttyfast

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


 " ==== 多语言 ==== 
 set encoding=utf-8
 set termencoding=utf-8
 set formatoptions+=mM      
 set fencs=utf-8,gbk
 
 " ==== Vundle ====         
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'git://github.com/scrooloose/nerdtree.git'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'vim-scripts/indentpython.vim'
 Plugin 'vim-syntastic/syntastic'
 Plugin 'nvie/vim-flake8'
 Plugin 'Lokaltog/vim-powerline'
 Plugin 'tell-k/vim-autopep8' " 自动PEP8
 Plugin 'jiangmiao/auto-pairs' " 自动补全括号和引号等
 Plugin 'kien/ctrlp.vim'
 Plugin 'tpope/vim-fugitive'
 call vundle#end()
 
 autocmd vimenter * NERDTree
 
 filetype plugin indent on
 
 " ==== themes ====
 set background=dark
 "colorscheme solarized
 colorscheme molokai
 
 map <C-n> :NERDTreeToggle<CR>
 let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowCollapsible = '▾'

 " ==== YCM ====
 let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
 let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
 let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
 let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"
 let g:ycm_auto_trigger = 1   "turn on
 
 nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
 
 autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
 
 map <F5> :call RunPython()<CR>
 func! RunPython()
     exec "W"
     if &filetype == 'python'
         exec "!time python2.7 %"
     endif
 endfunc

