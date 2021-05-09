"let g:neomake_<<language>>_enabled_makers = ["<<maker>>"]
let g:neomake_open_list    = 1
let g:neomake_error_sign   = {"text": "❯❯"}
let g:neomake_warning_sign = {"text": "❯❯"}
let g:neomake_info_sign    = {"text": "❯❯"}
let g:neomake_message_sign = {"text": "❯❯"}
nnoremap <silent> <leader>m :Neomake<CR>
nnoremap <silent> <leader><BS> :sign unplace *<CR>:set signcolumn=auto<CR>
