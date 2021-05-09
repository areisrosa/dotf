nnoremap <silent> <localleader>tf :TestFile<CR>
nnoremap <silent> <localleader>tl :TestLast<CR>
nnoremap <silent> <localleader>ts :TestSuite<CR>
nnoremap <silent> <localleader>tt :TestNearest<CR>
if has("nvim")
	let test#strategy = "neovim"
else
	let test#strategy = "vimterminal"
endif
