" Configuration file for vim

" ==== Base Settings ====
" 不与Vi兼容(采用Vim自己的操作命令)
set nocompatible
" 开启语法高亮
syntax on
" 左下角显示当前vim模式
set showmode
" 在状态栏显示正在输入的命令
set showcmd
" 允许使用鼠标点击定位
set mouse=a
" 使用utf-8编码
set encoding=utf-8
" 使用256色
set t_Co=256
" 开启文件类型检查
filetype indent on
" 自动缩进
set autoindent
" 设置Tab键的宽度        [等同的空格个数]
set ts=4
" 每一次缩进对应的空格数
set shiftwidth=4
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 按退格键时可以一次删掉 4 个空格
set softtabstop=4
" 显示行号
set nu
" 显示光标所在的当前行的行号
set relativenumber
" 突出显示当前行
set cursorline
" 突出显示当前列
set cursorcolumn
" 设置行宽
set textwidth=80
" 关闭自动换行
set nowrap
" 特殊符号才换行(回车)
set linebreak
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
" 是否显示状态栏
set laststatus=2
" 在状态栏显示光标的当前位置
set ruler

" Search Settings
" 括号匹配高亮
set showmatch
" 搜索词匹配高亮
set hlsearch
" 输入搜索时自动匹配
set incsearch
" 关闭搜索高亮
nnoremap <leader><space> :nohlsearch<CR>

" Edit Settings
" 英文单词拼写检查
" set spell spelllang=en_us
" 不创建备份
set nobackup
" 不创建交换文件
set noswapfile
" 保留撤销历史
set undofile
" 自动切换目录
set autochdir
" 当文件在外部修改时，Vim自动更新载入
set autoread
" 出错时，不要发出响声
set noerrorbells
" 显示行尾多余空格
set listchars=tab:»■,trail:■
set list
" 命令模式下，命令自动补全
set wildmenu
set wildmode=longest:list,full
" Enable folding with the spacebar
nnoremap <space> za
" 标示不必要的空白字符
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" 透明度
hi Normal ctermfg=252 ctermbg=none

set backspace=indent,eol,start
set magic " 设置魔术
" 折叠
set foldmethod=indent
set foldlevel=99
" 设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr

 " Smart indent
set smartindent

" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

set ttyfast

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" How many tenths of a second to blink when matching brackets
set matchtime=2
" ==== Base Settings ====

" ==== 多语言 ====
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk

" ==== Python Settings ====
let python_highlight_all=1

" 代码缩进
au BufNewFile,BufRead *.py
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
            \ set expandtab
            \ set autoindent
            \ set fileformat=unix

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

 map <F5> :call RunPython()<CR>
 func! RunPython()
     exec "W"
     if &filetype == 'python'
         exec "!time python2.7 %"
     endif
 endfunc
" ==== Python Settings ====

" 前端代码缩进
au BufNewFile,BufRead *.js, *.html, *.css, *.vue
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2
" 前端代码缩进

" ==== Eslint ====
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" " turn to next or previous errors, after open errors list
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>
" " check also when just opened the file
let g:syntastic_check_on_open = 1
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_checkers = ['eslint']
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0
" " custom icons (enable them if you use a patched font, and enable the previous 
" " setting)
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
" ==== Eslint ====


" ==== Vundle ====
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" 底部工具条
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 目前最强自动补全
Plugin 'Valloric/YouCompleteMe'
" 文件浏览
Plugin 'scrooloose/nerdtree'
" 语法检查
Plugin 'scrooloose/syntastic'
" PEP8风格检查
Plugin 'nvie/vim-flake8'
" Git集成
Plugin 'tpope/vim-fugitive'
" 搜索插件
Plugin 'kien/ctrlp.vim'
" 源码结构工具
Plugin 'taglist.vim'
" Vue语法高亮插件
Plugin 'posva/vim-vue'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tell-k/vim-autopep8' " 自动PEP8
Plugin 'jiangmiao/auto-pairs' " 自动补全括号和引号等
call vundle#end()
filetype plugin indent on
" ==== Vundle ====

" ==== themes ====
set background=dark
" colorscheme solarized
colorscheme molokai
" ==== themes ====

" ==== NERDTree ====
" 显示行号
let NERDTreeShowLineNumbers=1
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" ==== NERDTree ====

" ==== YCM ====
let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数"
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径"
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询"
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口"
let g:ycm_auto_trigger = 1   "turn on

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ==== YCM ====

" ==== ctrlp ====
" 设置ctrlp的快捷方式 ctrp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置ctrlp的窗口位置
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
" ==== ctrlp ====

" ==== tagslist ====
" 让taglist窗口出现在Vim的左边边
let Tlist_Use_Left_Window=1
" 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close=1
" 只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File=1
" Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type='name'
" Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen=1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1
" 设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth=32
" 这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
let Tlist_Ctags_Cmd='/usr/bin/ctags'
" ==== tagslist ====

" ==== 快捷键 ====
" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" F1 ~ F12
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
map <F2> :TlistToggle<CR>
set pastetoggle=<F9>

