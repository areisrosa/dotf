" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on
"
" " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" " can be called correctly.
set shellslash
"
" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
"" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Configuration: Quicktex
"
let g:quicktex_trigger = "\t"

