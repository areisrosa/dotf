" Variables: Vimux
let g:VimuxHeight ="20"
let g:VimuxOrientation ="v"
let g:VimuxRunnerType = "window"
" Mappings: Vimux
map ,vrc :call VimuxRunCommand("ruby")<cr>
map ,vtc :call VimuxRunCommand("rake test ./…")<cr>
map ,vcr :call VimuxCloseRunner()<cr>
map ,vpc :call VimuxPromptCommand("rails console")<cr>
"
