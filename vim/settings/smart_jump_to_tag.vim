" hit ,tg to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,tg <C-]>
" use ,T to jump to tag in a vertical split
nnoremap <silent> ,T :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>
