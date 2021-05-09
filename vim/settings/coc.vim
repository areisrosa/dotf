"" ============================================================================
" Coc Configurations ------------------------------------------------ {{{ 
" =============================================================================
"
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
		\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
		\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('C', 'CocConfig')

let g:coc_global_extensions = [
 \ 'coc-snippets',
 \ 'coc-pairs',
 \ 'coc-tsserver',
 \ 'coc-vetur',
 \ 'coc-eslint',
 \ 'coc-prettier',
 \ 'coc-json',
 \ 'coc-html',
 \ 'coc-emmet',
 \ 'coc-css',
 \ 'coc-imselect',
 \ 'coc-emoji',
 \ 'coc-stylelint',
 \ 'coc-python',
 \ 'coc-highlight',
 \ 'coc-git',
 \ 'coc-post',
 \ 'coc-lists',
 \ ]
"
"}}}
" =============================================================================
