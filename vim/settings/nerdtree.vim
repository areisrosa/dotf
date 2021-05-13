" =============================================================================
" Nerdtree ----------------------------------------------------------------- {{{
" =============================================================================
"
" Replace arrows with text characters; not all terminal and font combinations
" provide arrows.
let g:NERDTreeDirArrowExpandable  = "+"
let g:NERDTreeDirArrowCollapsible = "⠶"
"let NERDTreeStatusline            = " NERDTree "
"let NERDTreeHijackNetrw           = 0
" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore              = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
"
"-------------------------------------------------------------------------------
" Refresh: Upon entering the NERDTree window do a root directory refresh to
" automatically pick up any file or directory changes.
"
" Function (1) :
"
function! NerdTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd! BufEnter * call NerdTreeRefresh()
"
"-------------------------------------------------------------------------------
"
" Function (2) :
"
"function! OpenNerdTree()
"    let l:is_nerdtree = expand('%') =~#'NERD_tree'
"    let l:is_cur_buf_empty = empty(expand("%"))
"    "
"    if l:is_nerdtree || l:is_cur_buf_empty
"        execute'NERDTreeToggle'
"    else
"        execute'NERDTreeFind'
"    endif
"endfunction
""
"if empty(maparg('\','n'))
"    nmap <silent><C-\> :call OpenNerdTree()<CR>
"endif

" Open the project tree and expose current file in the nerdtree with Ctrl-\ "
" calls NERDTreeFind iff NERDTree is active, current window contains a
" modifiable file, and we're not in vimdiff
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction

nnoremap <silent> <C-\> :call OpenNerdTree()<CR>
nnoremap <silent> ,nt :NERDTreeToggle<CR> <C-w>=
nnoremap <silent> ,nf :NERDTreeFind<CR> <C-w>=
"
"-------------------------------------------------------------------------------
" Open: A NERDTree automatically when vim starts up
"-------------------------------------------------------------------------------
"autocmd vimenter * NERDTree
"-------------------------------------------------------------------------------
" Open: A NERDTree automatically when vim starts up if no files were specified
"-------------------------------------------------------------------------------
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"-------------------------------------------------------------------------------
" Open: NERDTree automatically when vim starts up on opening a director
"-------------------------------------------------------------------------------
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe'NERDTree' argv()[0] | wincmd p | ene | endif
"-------------------------------------------------------------------------------
" Close: Vim if the only window left open is a NERDTree
"-------------------------------------------------------------------------------
autocmd bufenter * if(winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"-------------------------------------------------------------------------------
"
"==============================================================================
"}}}
