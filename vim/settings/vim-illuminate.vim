" Time in milliseconds (default 250)
let g:Illuminate_delay = 250
" Don't highlight word under cursor (default: 1)
let g:Illuminate_highlightUnderCursor = 0
" You can define which highlight groups you want the illuminating to apply to.
" This can be done with a dict mapping a filetype to a list of highlight-groups
" in your vimrc such as:
"let g:Illuminate_ftHighlightGroups = {
            \ 'vim': ['vimVar', 'vimString', 'vimLineComment',
            \         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
            \ }
" Illuminate can also be disabled for various filetypes using the following:
let g:Illuminate_ftblacklist = ['nerdtree']
