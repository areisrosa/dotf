" Time in milliseconds (default 250)
let g:Illuminate_delay = 250
" Don't highlight word under cursor (default: 1)
let g:Illuminate_highlightUnderCursor = 0
" You can define which highlight groups you want the illuminating to apply to. This can be done with a dict mapping a filetype to a list of highlight-groups in your vimrc such as:
"let g:Illuminate_ftHighlightGroups = {
			\ 'vim': ['vimVar', 'vimString', 'vimLineComment',
			\         'vimFuncName', 'vimFunction', 'vimUserFunc', 'vimFunc']
			\ }
" Illuminate can also be disabled for various filetypes using the following:
let g:Illuminate_ftblacklist = ['nerdtree']
" I have line numbers displayed (set number) when editing code, so I already
" know what line number I'm on. I just need something to show me roughly how
" far through the document I am, without taking up 4+ characters in my
" statusline.
"Plug 'drzel/vim-line-no-indicator' " https://github.com/drzel/vim-line-no-indicator
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{LineNoIndicator()}
" I use vim-airline, so my settings look like this:
"let g:airline_section_x = '%{&filetype}'
"let g:airline_section_y = '%#__accent_bold#%{LineNoIndicator()}%#__restore__#'
"let g:airline_section_z = '%2c'
"let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '⎯'] " on Linux
