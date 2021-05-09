" Disable Default Key Mappings
" let g:vim_markdown_no_default_key_mappings = 1
" To disable math conceal with LaTeX math syntax enabled, add the following to
" your .vimrc:
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" Disabling conceal for code fences requires an additional setting:
let g:vim_markdown_conceal_code_blocks = 0
" Add the following line to your .vimrc to disable the folding configuration:
 let g:vim_markdown_folding_disabled = 1
 " You can use filetype name as fenced code block languages for syntax
 " highlighting. If you want to use different name from filetype, you can add it
 " in your .vimrc like so:
 let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'r=r']
