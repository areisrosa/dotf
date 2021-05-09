let g:grepper       = {}
let g:grepper.tools = ["rg"]
runtime autoload/grepper.vim
let g:grepper.jump  = 1
let g:grepper.stop  = 500
xmap gr <plug>(GrepperOperator)
noremap <leader>gr :GrepperRg<Space>
noremap <leader>*  :GrepperRg<Space>"\b<cword>\b"<CR>
" ~/dotfiles/vim/after/plugin/grepper.vim - customization
