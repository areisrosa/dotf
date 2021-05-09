" ==============================================================================
" Terminal Configuration --------------------------------------------------- {{{
" ==============================================================================
"
if !has("gui_running") && !has("nvim")
	" Note, Neovim cursor shape and 24-bit true colors work without any
	" help required; the following 'help' is for terminal Vim only.

	" if tmux
	if &term == "tmux-256color"
		" Change the cursor to an I-beam when in insert mode.
		let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
		" Make CTRL-Left/Right work inside tmux.
		execute "set <xRight>=\e[1;*C"
		execute "set <xLeft>=\e[1;*D"
		" Make Vim *set termguicolors* work inside tmux.
		set t_8b=[48;2;%lu;%lu;%lum
		set t_8f=[38;2;%lu;%lu;%lum
		" else not tmux
	else
		" Change the cursor to an I-beam when in insert mode.
		let &t_SI = "\e[6 q"
		let &t_EI = "\e[2 q"
	endif
endif
"
"}}}
