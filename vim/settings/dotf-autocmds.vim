" =============================================================================
" Autocmds ---------------------------------------------------------------- {{{
" =============================================================================

" Custom settings per language by file type.
augroup languageCustomizationsByType
	" Note, 'autocmd!' is used to clear out any existing definitions in
	" this auto-group. This prevents duplicate entries upon a live vimrc
	" reload.
	autocmd!
	autocmd FileType c,cpp          setlocal cindent foldmethod=syntax
	autocmd FileType eelixir        setlocal matchpairs=(:),{:},[:]
	autocmd FileType eruby          setlocal formatoptions=cq matchpairs=(:),{:},[:]
	" Setup indent markers for tab-indented Go code. Note, the IndentLine
	" plugin will not show markers for tab formatted code, so we need to mimic
	" what that plugin does here using listchars and highlighting.
	autocmd FileType go             setlocal list listchars=tab:\┊\ ,trail:-
	autocmd FileType go             highlight! link SpecialKey Conceal
	" Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
	autocmd FileType html           let b:match_words = "<\(\w\w*\):</\1,{:}"
	autocmd FileType java           setlocal cindent cinoptions+=j1 foldmethod=syntax
	"autocmd FileType javascript.jsx setlocal formatoptions=cq
	autocmd FileType json           set conceallevel=2
	autocmd FileType markdown       setlocal formatoptions=tqln
	autocmd FileType markdown       syntax sync fromstart
	autocmd FileType ruby           setlocal formatoptions=cq
	autocmd FileType scss           let g:indentLine_faster=0
	autocmd FileType vim            setlocal formatoptions=coql
augroup END

" Custom settings per language by file extension.
augroup languageCustomizationsByExtension
	autocmd!
	autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
	autocmd BufEnter *.html.erb        set omnifunc=htmlcomplete#CompleteTags
augroup END

" Style and behaviour customizations.
augroup styleAndBehaviourCustomizations
	autocmd!
	autocmd BufWinEnter    quickfix  setlocal cursorline colorcolumn=0
	autocmd FilterWritePre *         call DiffStyling()
	autocmd VimResized     *         wincmd =
	autocmd FileType       text      setlocal conceallevel=0
	if has("nvim")
		autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
		autocmd TermOpen * startinsert
		autocmd BufEnter   term://* startinsert
		autocmd VimLeave * set guicursor=a:block
	endif
augroup END
"
" Plugin-related behaviours.
augroup pluginBehaviours
	autocmd!
	autocmd FileType    *               IndentLinesReset
	autocmd Syntax      *               IndentLinesReset
	autocmd BufWinEnter \[BufExplorer\] setlocal colorcolumn=0
	autocmd BufWinLeave \[BufExplorer\] setlocal colorcolumn=81,82
	autocmd FileType    nerdtree        IndentLinesDisable
	autocmd FileType    nerdtree
				\ setlocal colorcolumn=0 conceallevel=0 matchpairs=
	autocmd FileType css,scss
				\ let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
	autocmd FileType crystal,elixir,json
				\ let b:closer = 1 | let b:closer_flags = "([{"
	if has("nvim")
		" Escape inside a FZF terminal window should exit the terminal window
		" rather than going into the terminal's normal mode.
		autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
	endif
augroup END

" Auto-read behaviour.
augroup autoRead
	autocmd!
	autocmd CursorHold * silent! checktime
augroup END
