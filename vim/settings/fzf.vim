" ==============================================================================
" FZF ---------------------------------------------------------------------- {{{
" ==============================================================================
"
" Open files with command-line fuzzy finder(=fzf)
" mapped the :Files or :FZF command to it like this.
"
if executable('pt')
  " Filter items through ag to respect gitignore
  let $FZF_DEFAULT_COMMAND = 'pt -l -g ""'
endif
"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ }
"
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"
" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"
" Run your favorite search tool from Vim, with an enhanced results list.
let g:fzf_layout = { "window": "silent botright 16split enew" }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always	
			\ --format="%C(yellow)%h%C(red)%d%C(reset)
			\ - %C(bold green)(%ar)%C(reset) %s %C(blue){%an}%C(reset)"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" Look for files under current directory
nnoremap <silent>  ,fzf    :FZF<CR>
" Tags in the project (ctags -R)
nnoremap <silent>  ,ft   :Tags<CR>
" Tags in the current buffer
nnoremap <silent>  ,fbt  :BTags<CR>
" Help tags 
nnoremap <silent>  ,fht  :Helptags<CR>
" Lines in the current buffer
nnoremap <silent>  ,fbl  :BLines<CR>
" Open buffers
nnoremap <silent>  ,fb   :Buffers<CR>
" Lines in loaded buffers
nnoremap <silent>  ,fl   :Lines<CR>
" Windows
nnoremap <silent>  ,fw   :Windows<CR>
" Git commits (requires fugitive.vim)
nnoremap <silent>  ,fc   :Commits<CR>
" Git commits for the current buffer
nnoremap <silent>  ,fbc  :BCommits<CR>
" Git files (git status)
nnoremap <silent>  ,fg   :GFiles?<CR>
" Normal mode mappings
nnoremap <silent>  ,fm   :Maps<CR>
" ag search result (ALT-A to select all, ALT-D to deselect all)
nnoremap <silent>  ,fa   :Ag<CR>
" Snippets (UltiSnips)
nnoremap <silent>  ,fs   :Snippets<CR>
"
"}}}
