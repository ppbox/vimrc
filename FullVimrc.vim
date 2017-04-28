set runtimepath+=$HOME/.vim



"" ---- Vundle - plugin manager ----
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" plugins from github
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'bling/vim-airline'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
" Alignment
Plugin 'godlygeek/tabular'
" indentline
Plugin 'Yggdroot/indentLine'
" silversearcher
Plugin 'rking/ag.vim'
" repeat vimscript commands
Plugin 'tpope/vim-repeat'
" mark
Plugin 'vim-scripts/Mark--Karkat'
" file and window manager
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
" multiple cursor
Plugin 'terryma/vim-multiple-cursors'
" snippet
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" c/c++/python/go/rust
Plugin 'Valloric/YouCompleteMe'
" html,css,js
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
" php
" Plugin 'shawncplus/phpcomplete.vim'
Plugin 'StanAngeloff/php.vim'
" java
Plugin 'artur-shaik/vim-javacomplete2'
" python 
Plugin 'hdima/python-syntax'
" rust
Plugin 'rust-lang/rust.vim'
" Plugin 'phildawes/racer' ycm support it
" golang
" Plugin 'fatih/vim-go'
" markdown
Plugin 'plasticboy/vim-markdown'
" thrift
Plugin 'solarnz/thrift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" ---- Vundle - plugin manager ----


"" ---- plugin configure ----


"" ---- ctags cscope ----
"在有ctags支持下的Taglist配置
"设置ctags从当前目录递归向上搜索tags文件
set tags=./tags;,tags

" set nocscopeverbose
cs add ./cscope.out
cs add ../cscope.out
cs add ../../cscope.out
cs add ../../../cscope.out
cs add ../../../../cscope.out
cs add ../../../../../cscope.out
cs add ../../../../../../cscope.out
cs add ../../../../../../../cscope.out

"cscope key mapping
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"" ---- ctags cscope ----


"" ---- tagbar ----
nmap <F9> :TagbarToggle<cr>
let g:tagbar_right=1
" let g:tagbar_width=40
let g:tagbar_foldlevel=99
let g:tagbar_show_visibility=1
let g:tagbar_show_linenumbers=0
let g:tagbar_autoshowtag=1
let g:tagbar_sort=0
let g:tagbar_expand = 2
autocmd VimEnter,BufNewFile,BufRead * nested :call tagbar#autoopen(1)
autocmd VimEnter * nested :TagbarSetFoldlevel! 99

"" ---- tagbar ----


"" ---- YouCompleteMe ----
" disable YCM in some file
let g:ycm_filetype_blacklist = {
\  'tagbar' : 1,
\  'nerdtree' : 1,
\}
if has("win32")
    " YCM need python2 or python3
    let g:ycm_path_to_python_interpreter='C:/software/Python27/python'
    " complete by python2 or python3
    let g:ycm_python_binary_path='C:/software/Python27/python'
else
    let g:ycm_path_to_python_interpreter='/usr/bin/python3'
    let g:ycm_python_binary_path='/usr/bin/python3'
endif
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_global_extra_conf.py'
let g:ycm_show_diagnostics_ui=0
let g:ycm_register_as_syntastic_checker=0
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
" key mappings
nnoremap<C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion=['<c-n>', '<Down>' ]
let g:ycm_key_list_previous_completion=['<c-p>', '<Up>' ]
" for python
let python_highlight_all = 1
" for rust
" install rust-src on windows: rustup component add rust-src
if has("win32")
    let g:ycm_rust_src_path = '$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src'
else
    let g:ycm_rust_src_path = 'C:/Users/linrongbin/.rustup/toolchains/stable-x86_64-pc-windows-msvc/lib/rustlib/src/rust/src'
endif
"" ---- YouCompleteMe ----


" ---- UltiSnips ----
" Ctrl-k is key mapping of neosnippet's snippet expand key
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsListSnippets="<c-e>"
"定义存放代码片段的文件夹，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]
let g:UltiSnipsEditSplit="vertical"
" ---- UltiSnips ----


" ---- DoxygenToolkit ----
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_blockHeader="----------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="zhaochenyou16@gmail.com"
let g:DoxygenToolkit_briefTag_className="yes"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_briefTag_enumName="yes"
let g:DoxygenToolkit_briefTag_namespaceName="yes"
let g:DoxygenToolkit_briefTag_structName="yes"
" ---- DoxygenToolkit ----


" ---- AirLine ----
let g:airline#extension#tabline#enabled = 1
" ---- AirLine ----


" ---- Indent Line ----
let g:vim_json_syntax_conceal = 0
" ---- Indent Line ----


" ---- vim-markdown
let g:vim_markdown_conceal = 0
" ---- vim-markdown


" ---- vimfiler ----
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ''
let g:vimfiler_safe_mode_by_default= 0
let g:vimfiler_tree_indentation = 2
call vimfiler#custom#profile('default', 'context', {
            \  'split': 1,
            \  'explorer': 1,
            \  'columns': 40,
            \  'explorer-columns': 40,
            \  'direction': 'topleft',
            \  'auto_expand': 1,
            \  'no_quit': 1,
            \  'force_hide': 0,
            \  'toggle': 1,
            \  'parent': 1,
            \ })
" toggle to open explorer and close it
" make sure the raw window is 90
" tagbar, vimfiler is 40
" when open one of them, width goto 130
" when both of them, width goto 170
let g:vimfiler_opened_flag = 0
function AdjustVimFilerWidth()
    if g:vimfiler_opened_flag == 0
        let g:vimfiler_opened_flag=1
        set columns=170
    else
        let g:vimfiler_opened_flag=0
        set columns=130
    endif
endfunction
nmap <F8> :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>
" :VimFilerExplorer<cr>:call AdjustVimFilerWidth()<cr>

" autocmd VimEnter * if !argc() | VimFiler | endif
" call VimFiler when start
" ---- vimfiler ----


" ---- php.vim ----
let g:php_syntax_extensions_enabled = 1
" ---- php.vim ----


"" ---- emment ----
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\  'haml' : {
\    'extends' : 'html',
\  },
\}
let g:user_emmet_expandabbr_key='<c-e>'
let g:use_emmet_complete_tag=1
"" ---- emment ----


"" ---- javacomplete2 ----
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"" ---- javacomplete2 ----


"" ---- easymotion ----
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>g <Plug>(easymotion-overwin-f2)
"" ---- easymotion ----


" Basic Configure
source ~/.vim/BasicVimrc.vim
