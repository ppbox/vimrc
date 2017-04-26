set runtimepath+=$HOME/.vim

set nocompatible
set fileformats=unix,dos,mac
if has("gui_running")
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

if has("win32")
    "source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()
    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

"显示命令
set showcmd
set hlsearch
"退格键能够换行
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
"共享剪贴板
set clipboard+=unnamed 
"当文件被改动时自动载入
set autoread
set autowrite
set ruler
set magic
"可以使用鼠标
set mouse=a 
set selection=exclusive 
set selectmode=mouse,key 
"括号匹配
set showmatch
"大小写敏感
set noignorecase
set laststatus=2 
"侦测文件类型
filetype on
"允许插件
filetype plugin on
filetype indent on
set nobackup
set noswapfile
set nowritebackup

"vim程序内部的编码
set encoding=utf-8 
"vim打开的文件自身的编码 
"若该编码与encoding不一致则vim将文件所用的编码转化为自身的encoding
set fileencoding=utf-8
"打开文件时vim按照该列表中的编码顺序进行解码 若匹配成功就用该编码进行解码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
"终端使用的文本编码 即当vim把文本内容输出到终端时使用的编码
"该编码应该指定为vim所在的操作系统的终端的编码 linux为utf-8 windows下为gbk
set termencoding=utf-8

"win下gvim处理菜单及右键菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"win下gvim处理Consle输出乱码
language messages en_US.utf-8

"Ctrl+hjkl在不同窗口下移动光标
"与neosnippet快捷键冲突
" nmap <C-H> <C-w>h
" nmap <C-J> <C-w>j
" nmap <C-K> <C-w>k
" nmap <C-L> <C-w>l
map Q <Nop>

"不要设置completeopt=preview
"代码补全时不要出现额外的窗口
set completeopt=menu


"行号
set number
set numberwidth=5
set lines=40
set columns=200
"gvim下字体
if has("win32")
    set guifont=FreeMono:h11
    set guifont=Courier\ New:h11
    set guifont=Monaco:h11
else 
    set guifont=FreeMono\ 11
    set guifont=Courier\ 10\ Pitch\ 11
    set guifont=Monaco\ 11
endif
"gvim下隐藏工具栏
set guioptions-=T
"gvim隐藏菜单栏
" set guioptions-=m
"光标移动到buffer的顶部和底部时保持1行距离
set scrolloff=1
"不响警铃
set noerrorbells
set novisualbell
"关闭visual bell
set visualbell t_vb=  
"关闭beep
au GuiEnter * set t_vb= 

"缩进
set cindent 
set smartindent 
set autoindent 

"(1)使用space而不是tab
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
"(2)使用tab而不是space
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
"set noexpandtab tabstop=4 shiftwidth=4

"空格折叠
set foldenable 
set foldmethod=indent 
set foldnestmax=10
set foldlevel=10
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR> 
"语法高亮
syntax on 
syntax enable

" Color Theme
if has("gui_running")
    colorscheme desert
    colorscheme solarized
endif
let g:solarized_termcolors=256
set background=dark

" whitespace/tab/endline
set list
set list listchars=tab:>-,trail:.,extends:>
