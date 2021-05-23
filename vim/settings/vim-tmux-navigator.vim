"   you can use the five provided functions to define 
"   your own custom maps.
let g:tmux_navigator_no_mappings = 1

" Autosave on leave
" " Write all buffers before navigating from Vim to tmux pane
" let g:tmux_navigator_save_on_switch = 2
" Seamless CTRL-h/j/k/l navigation between Vim splits  and tmux panes.
" Note, only set up mappings if running inside tmux.
" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".
if ($TERM == "screen-256color")
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
    nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>
else
    nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <c-l> :TmuxNavigateRight<cr> 
    nnoremap <silent> <c-;> :TmuxNavigatePrevious<cr>
endif

" Nvim in a Terminal Emulation
if has("nvim")
    tmap <c-j> <c-h> :TmuxNavigateLeft<cr>
    tmap <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
    tmap <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
    tmap <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
    tmap <c-;> <c-\><c-n>:TmuxNavigatePrevious<cr>
endif
