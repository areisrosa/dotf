" Value 0: Don't ask before loading a vimrc file.
" This plugin searches for local vimrc files in the file system tree of the currently opened file. It searches for all 
".lvimrc" files from the directory of the file up to the root directory. By default those files are loaded in order 
" from the root directory to the directory of the file. The filename and amount of loaded files are customizable through global variables.

" For Kernel Linux config (Template)
"set tabstop=8
"set noexpandtab
"set shiftwidth=8
"set listchars="tab:>,trail:-,nbsp:+"
"set textwidth=80
"set colorcolumn=80

" Ask before sourcing any local vimrc file. In a vim session the question is
" only asked once as long as the local vimrc file has not been changed.
let g:localvimrc_ask = 0
