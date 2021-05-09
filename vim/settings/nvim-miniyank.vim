if has("nvim")
    let g:miniyank_filename = $HOME."/.miniyank.mpack"
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
endif

