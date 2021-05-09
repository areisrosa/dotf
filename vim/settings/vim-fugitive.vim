" ==============================================================================
" Fugitive ----------------------------------------------------------------- {{{
" ==============================================================================
" Setting Options
noremap <silent> ,gb :Gblame<CR>
noremap <silent> ,gd :Gdiff<CR>
noremap <silent> ,gs :Gstatus<CR>
"
" Function (1) :
"
function! Fugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? branch . '' :  ''
	endif
	return ''
endfunction
"
"}}}
" ==============================================================================
