" =============================================================================
" Syntastic: Config Opitional --------------------------------------------- {{{
" =============================================================================

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_quiet_messages           = {'level': 'warnings'}

map <C-s> :SyntasticToggleMode<CR>
"
" }}}
" =============================================================================
