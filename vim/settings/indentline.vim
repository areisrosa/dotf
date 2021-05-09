" ==============================================================================
" Indentation -------------------------------------------------------------- {{{
" ==============================================================================
"
" This plugin is used for displaying thin vertical lines at each indentation
" level for code indented with spaces
let g:indentLine_char       = '┆'
let g:indentLine_faster     =  1
let g:indentLine_setColors  =  0
let g:indentLine_setConceal =  0
"
" Don't set colorcolumn and disable IndentLine when in Vim diff.
"
" Function (1) :
"
function! DiffStyling()
	if &diff
		setlocal colorcolumn=0
		:IndentLinesDisable
		highlight! link Visual VisualInDiff
	endif
endfunction
"
"}}}
" ==============================================================================

