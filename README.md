--------
## Powerful Vimrc

--------
#### Introduction
* this vimrc has many plugins, 
* it support languages such as C++/Rust/Go/Python/html/css/javascript/Markdown/...
* and useful tools such as tagbar/DoxygenToolkit/nerdcommenter/indentLine/ctrlp/silversearcher...

#### Installation
1. Download the package to local ~/.vim: ```git clone https://github.com/zhaochenyou/vimrc.git ~/.vim```
2. Then install VundleVim/Vundle.vim: ```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```
3. There are several versions of .vimrc:
    1. BasicVimrc.vim           - basic vim configure with no plugins.
    2. FullVimrc.vim             - full box of plugins.

Copy one of them to ~/.vimrc, open vim and type ```:PluginInstall```<br/>
Copy '.ycm_extra_conf.py' to project root directory, and modify the 'flags' to fit.<br/>
<br/>
Have fun.<br/>


--------
#### key binding document

1. ctags - code completion
```
ctrl+] : go to definition
ctrl+t : go back to previous position
```

2. cscope - code completion
```
ctrl+\+s : find s     find C symbol
ctrl+\+g : find g     find definition
ctrl+\+d : find d     find functions called by this function
ctrl+\+c : find c     find functions calling this function
ctrl+\+t : find t     find string
ctrl+\+e : find e     find egrep pattern
ctrl+\+f : find f     find file
```

3. YouCompleteMe - code completion
```
ctrl+] : go to definition or declaration
ctrl+n : select next when autocomplete
ctrl+p : select prev when autocomplete
```

4. ultisnips - code snippets
```
ctrl+k : expand snippets
ctrl+e : list all snippets
```

5. tagbar - function declaration list
```
F9 : open/close tagbar
```

6. vimfiler - file exploror
```
F8 : open/close vimfiler
K : create new directory
N : create new file
m : move file
c : copy file
d : delete file
r : rename file
```

7. Mark--Karkat - highlight word
```
\+m : mark/cancel
\+n : cancel all marks
\+* : goto next mark in same color
\+/ : goto next any mark
```

8. DoxygenToolkit.vim - generate doxygen comment
```
:Dox : generate doxygen comment for class/function
:DoxLic : generate doxygen license comment for a source code file
:DoxAuthor : generate doxygen author comment for a source code file
:DoxBlock : generate doxygen comment block
```

9. nerdcommenter - enable/disable comment
```
\+c+space : make/cancel comment
\+c+a: change comment type between //... and /*...*/
```

10. vim-surround - change quotation, bracket, xml/html tags
```
csXY (change surround) : change X to Y, forexample: cs"': "..."->'...', cs'": '...'->"...", " cs'<q>: '...'-><q>...</q>
dsX (delete surround) : delete X, forexample: ds": "..."->..., cs<q>: <q>...</q>->...
```

11. vim-easymotion - move super fast
```
\+w : goto word
\+fX : goto one char 'X'
\+gXY : goto two char 'XY'
\+\+j : go down
\+\+k : go up
```

12. ctrlp.vim - find file
```
ctrl+p : find file
```

13. ag.vim - search text in files
```
:Ag+text : find 'text' in all files
```

14. vimfiler.vim - file exploror
```
F8 : open/close exploror window
```

14. vim-multiple-cursors - file exploror
```
F8 : open/close exploror window
```

15. emmet - html/css fast writer
```
TODO
```
