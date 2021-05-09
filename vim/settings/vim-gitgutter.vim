" ==============================================================================
" Gitgutter ---------------------------------------------------------------- {{{
" ==============================================================================
"
" Settings optional
let g:gitgutter_sign_added = '⊕'
let g:gitgutter_sign_modified = '⊘'
let g:gitgutter_sign_removed = '⊗'
let g:gitgutter_sign_removed_first_line = '⊙'
let g:gitgutter_sign_modified_removed = '⊖'
let g:gitgutter_max_signs = 3000
"
" Changes vim refresh rate. As of version 7.2, the refresh rate is 4000ms.
" " This is set to vim-gitgutter get faster when showing edited lines.
" " slower numbers gets more glitches. See :help updatetime
set updatetime=2000
"
" Function (1): 
"
function! Gitgutter()
	let symbols =['+','-','~']
	let [added, modified, removed] = gitgutter#hunk#summary(winbufnr(0))
	let stats =(added, removed, modified) " reorder
	let hunkline =''

	for i in range(3)
		if stats[i] > 0
			let hunkline .= printf('%s%s', symbols[i], stats[i])
		endif
	endfor

	if !empty(hunkline)
		let hunkline = printf('%s', hunkline[:-2])
	endif
	return hunkline
endfunction
"
"}}}
" ==============================================================================
