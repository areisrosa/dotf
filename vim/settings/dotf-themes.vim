"==============================================================================
" Themes and Style Settings ----------------------------------------------- {{{
"==============================================================================
"
" Gruvbox Theme ===============================================================
set background=dark
let g:gruvbox_termcolors        = 256    " Adds 256 colors in terminal. Default is 16. Just in case
let g:gruvbox_contrast_dark     = 'hard' " High contrast baby!
let g:gruvbox_italic            = 1
let g:gruvbox_bold              = 1

" Dracula Theme ===============================================================
augroup dracula_customization
let g:dracula_colorterm = 1
    autocmd ColorScheme dracula hi CursorLine cterm=underline term=underline
    autocmd ColorScheme dracula hi Pmenu ctermfg=15 ctermbg=61 cterm=NONE guifg=#f8f8f2 guibg=#646e96 gui=NONE
    autocmd ColorScheme dracula hi PmenuSel ctermfg=16 ctermbg=84 cterm=bold guifg=#282a36 guibg=#50fa7b gui=NONE
    autocmd ColorScheme dracula hi Normal ctermbg=NONE term=NONE
augroup END

" Devicons Configurations =====================================================
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" PowerLine Configurations ====================================================
let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}

" AirLine Configurations ======================================================
" Allows airline bar with cool icons <3 - Install a Patched font
let g:airline_powerline_fonts = 1
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" Unicode Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = " \uf7a1"

" AirLine Themes ==============================================================
" let g:airline_theme='badwolf'
" let g:airline_theme='ravenpower'
" let g:airline_theme='simple'
" let g:airline_theme='term'
" let g:airline_theme='ubaryd'
" let g:airline_theme='laederon'
" let g:airline_theme='kolor'
" let g:airline_theme='powerlineish'
" let g:airline_theme='bubblegum'
" let g:airline_theme='alduin'
" let g:airline_theme='angr'
" let g:airline_theme='apprentice'
" let g:airline_theme='atomic'
" let g:airline_theme='ayu_light'
" let g:airline_theme='kayu_mirage'
" let g:airline_theme='ayu_dark'
" let g:airline_theme='badwolf'
" let g:airline_theme='base16'
" let g:airline_theme='base16_vim'
" let g:airline_theme='base16_shell'
" let g:airline_theme='base16_3024'
" let g:airline_theme='base16_adwaita'
" let g:airline_theme='base16_apathy'
" let g:airline_theme='base16_ashes'
" let g:airline_theme='base16_atelierdune'
" let g:airline_theme='base16_atelierforest'
" let g:airline_theme='base16_atelierheath'
" let g:airline_theme='base16_atelierlakeside'
" let g:airline_theme='base16_atelierseaside'
" let g:airline_theme='base16_bespin'
" let g:airline_theme='base16_brewer'
" let g:airline_theme='base16_bright'
" let g:airline_theme='base16_chalk'
" let g:airline_theme='base16_classic'
" let g:airline_theme='base16_codeschool'
" let g:airline_theme='base16_colors'
" let g:airline_theme='base16_default'
" let g:airline_theme='base16_eighties'
" let g:airline_theme='base16_embers'
" let g:airline_theme='base16_flat'
" let g:airline_theme='base16_google'
" let g:airline_theme='base16_grayscale'
" let g:airline_theme='base16_greenscreen'
" let g:airline_theme='base16_gruvbox_dark_hard'
" let g:airline_theme='base16_harmonic16'
" let g:airline_theme='base16_hopscotch'
" let g:airline_theme='base16_isotope'
" let g:airline_theme='base16_londontube'
" let g:airline_theme='base16_marrakesh'
" let g:airline_theme='base16_mocha'
" let g:airline_theme='base16_monokai'
" let g:airline_theme='base16_nord'
" let g:airline_theme='base16_ocean'
" let g:airline_theme='base16_oceanicnext'
" let g:airline_theme='base16_paraiso'
" let g:airline_theme='base16_pop'
" let g:airline_theme='base16_railscasts'
" let g:airline_theme='base16_seti'
" let g:airline_theme='base16_shapeshifter'
" let g:airline_theme='base16_solarized'
" let g:airline_theme='base16_spacemacs'
" let g:airline_theme='base16_summerfruit'
" let g:airline_theme='base16_tomorrow'
" let g:airline_theme='base16_twilight'
" let g:airline_theme='base16_vim'
" let g:airline_theme='base16color'
" let g:airline_theme='behelit'
" let g:airline_theme='biogoo'
" let g:airline_theme='bubblegum'
" let g:airline_theme='cobalt2'
" let g:airline_theme='cool'
" let g:airline_theme='dark'
" let g:airline_theme='dark_minimal'
" let g:airline_theme='desertink'
" let g:airline_theme='deus'
" let g:airline_theme='distinguished'
"let g:airline_theme='dracula'
" let g:airline_theme='dracula_pro'
let g:airline_theme='dracula_van_helsing'
" let g:airline_theme='durant'
" let g:airline_theme='faryfloss'
" let g:airline_theme='fruit_punch'
" let g:airline_theme='google_dark'
" let g:airline_theme='google_light'
" let g:airline_theme='hybrid'
" let g:airline_theme='hybridline'
" let g:airline_theme='jay'
" let g:airline_theme='jellybeans'
" let g:airline_theme='jet'
" let g:airline_theme='kalisi'
" let g:airline_theme='kolor'
" let g:airline_theme='laederon'
" let g:airline_theme='lessnoise'
" let g:airline_theme='light'
" let g:airline_theme='lighthaus'
" let g:airline_theme='lucius'
" let g:airline_theme='luna'
" let g:airline_theme='minimalist'
" let g:airline_theme='molokai'
" let g:airline_theme='monochrome'
" let g:airline_theme='murmur'
" let g:airline_theme='night_owl'
" let g:airline_theme='nord'
" let g:airline_theme='onedark'
" let g:airline_theme='ouo'
" let g:airline_theme='owo'
" let g:airline_theme='papercolor'
" let g:airline_theme='peaksea'
" let g:airline_theme='powerlineish'
" let g:airline_theme='qwq'
" let g:airline_theme='raven'
" let g:airline_theme='ravenpower'
" let g:airline_theme='seagull'
" let g:airline_theme='seoul256'
" let g:airline_theme='serene'
" let g:airline_theme='sierra'
" let g:airline_theme='silver'
" let g:airline_theme='simple'
" let g:airline_theme='soda'
" let g:airline_theme='sol'
" let g:airline_theme='solarized'
" let g:airline_theme='solarized_flood'
" let g:airline_theme='term'
" let g:airline_theme='term_light'
" let g:airline_theme='tomorrow'
" let g:airline_theme='ubaryd'
" let g:airline_theme='understated'
" let g:airline_theme='violet'
" let g:airline_theme='wombat'
" let g:airline_theme='xtermlight'
" let g:airline_theme='zenburn'
"let g:airline_theme='transparent'

" AirLine Colorschme ==========================================================
"colorscheme gruvbox
colorscheme dracula
"colorscheme wombat256
"colorscheme tango
"colorscheme railscasts
"colorscheme vividchalk
"colorscheme distinguished
"colorscheme monokai
"colorscheme molokai
"colorscheme ir_black
"colorscheme neodark
"colorscheme kolor
"colorscheme gotham
"colorscheme jellybeans
"colorscheme desertEx
"colorscheme skittles_berry
"colorscheme skittles_dark
"colorscheme codeblocks_dark

" AirLine Tmuxline ============================================================
" Enable airline/tmuxline status bar during start of tmux
" and enable/disable tmuxline integration
let g:airline#extensions#tmuxline#enabled = 1
" If specified, setting this option will trigger writing to the file whenever the
" Airline Theme is applied, i.e. when :AirlineTheme is executed and on vim
" startup
let g:airline#extensions#tmuxline#snapshot_file = "~/.tmux-statusline-colors.conf"
