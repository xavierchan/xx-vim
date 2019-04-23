" Configuration file for vim

" ==== Base Settings ====
" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" Search Settings
" 括号匹配高亮
set showmatch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" 命令模式下，命令自动补全
set wildmenu
set wildmode=longest:list,full
" 关闭搜索高亮
nnoremap <leader><space> :nohlsearch<CR>

" 开发氛围
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 辅助功能
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 关闭自动换行
set nowrap
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 缩进设置
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
set foldlevel=99
" 启动 vim 时关闭折叠代码
set nofoldenable



" 不与Vi兼容(采用Vim自己的操作命令)
set nocompatible
" 共享粘贴板
set clipboard+=unnamed
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
" 自动缩进
set autoindent
" 设置行宽
set textwidth=80
" 特殊符号才换行(回车)
set linebreak
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
highlight ColorColumn ctermbg=gray
set colorcolumn=80



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
" Enable folding with the spacebar
nnoremap <space> za
" 透明度
hi Normal ctermfg=252 ctermbg=none

set backspace=indent,eol,start
set magic " 设置魔术
" 折叠
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

autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

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

autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd Syntax javascript set syntax=jquery

" ==== Vundle ====
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" 底部工具条
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 目前最强自动补全
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
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
Plugin 'nathanaelkane/vim-indent-guides' " 缩进格式化呈现
" markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
call vundle#end()
filetype plugin indent on
" ==== Vundle ====

" ==== themes ====
set background=dark
" colorscheme solarized
" colorscheme phd
colorscheme molokai
"highlight NonText guibg=#060606
"highlight Folded guibg=#0A0A0A guifg=#909090
let g:molokai_original = 1
let g:rehash256 = 1
" ==== themes ====

" ==== python-mode ====
let g:pymode_options = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_indent = 1
let g:pymode_virtualenv = 1
"启用python语法检查
let g:pymode_lint = 1
"修改后保存时进行检查
let g:pymode_lint_on_write = 0
"编辑时进行检查
let g:pymode_lint_on_fly = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"不在父目录下查找.ropeproject，能提升响应速度
let g:pymode_rope_lookup_project = 0
"开启补全，并设置<C-Tab>为默认快捷键
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Tab>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
let g:pymode_rope_goto_definition_bind = '<C-c>g'
let g:pymode_rope_goto_definition_cmd = 'vnew'
"开启python所有的语法高亮
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
"高亮缩进错误
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"

" ==== vim-indent-guides ====
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
" ==== vim-indent-guides ====


" ==== NERDTree ====
" 显示行号
let NERDTreeShowLineNumbers=1
autocmd vimenter * NERDTree
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
" 默认开启TagList
let Tlist_Auto_Open=0
" 让taglist窗口出现在Vim的左边边
let Tlist_Use_Right_Window=1
" 当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close=1
" 只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File=1
" Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen=1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1
" 设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth=32
" 这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
let Tlist_Ctags_Cmd='/usr/bin/ctags'
set tags="/usr/bin/ctags"; set autochdir
" ==== tagslist ====

" ==== 快捷键 ====
" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" F1 ~ F12
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
set pastetoggle=<F9>
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

" 搜索窗快捷键
"fun! ToggleQuickFix()
"    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
"endf
"autocmd VimEnter * call ToggleQuickFix()


" 布局
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
nmap <F5> :NERDTreeToggle<CR>
nmap <F6> :TlistToggle<CR>

" 下窗口
set wildignore+=*/tmp?*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " User ag in CtrlP for listing files.
  let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
  " Ag is fast encough that CtrlP doesn't need to cache
  let g:ctrlp_user_caching=0
endif

" python文件头
"autocmd BufNewFile *.py exec ":call SetPythonTitle()"
"func SetPythonTitle()
"    call setline(1, "#!/usr/bin/env python")
"    call append(line("."), "#-*- coding: utf-8 -*-")
"    call append(line(".")+1, " ")
"    call append(line(".")+2, "\# File Name:  ".expand("%"))
"    call append(line(".")+3, "\# Author: XavierChan")
"    call append(line(".")+4, "\# mail: xavierchanit@gmail.com")
"    call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d", localtime()))
"endfunc

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

