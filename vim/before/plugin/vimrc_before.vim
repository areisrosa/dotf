" This loads before the dotf plugs so that plug mappings can
" be overwritten.

" Comment =====================================================================
" Delete comment character when joining commented lines
set formatoptions+=j
" The sequence of letters describes how automatic formatting is to be done
" c - Auto-wrap comments using textwidth, inserting the current comment leader
"     automatically
" q - Allow formatting of comments with "gq"
set formatoptions=cq

" History =====================================================================
set updatetime=1000

" Store =======================================================================
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir = "/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set viminfo=              "No backups
" This will set your path variable to current directory
" (from which you launched vim) and to all directories
" under current directory recursively.
set path=.,,**

" Performance Fixes ===========================================================
set regexpengine=1
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
"Disable timeout for Esc key
set ttimeout ttimeoutlen=0 notimeout
set ttyfast               " Optimize for fast terminal connections
set lazyredraw            " When this option is set, the screen will not be redrawn 
" while executing macros, registers and other commands that have not been typed
set noshowmatch           " No jumping cursors when matching pairs
set nowrapscan            " Don't wrap searches around
set synmaxcol=183         " Only syntax highlight for 183 chars (for performance)
"Completion do not select the first candidate
set completeopt=menuone,noselect
set complete-=i           " Disable completion by included files
set confirm               " Get a dialog when :q, :w, or :wq fails

" Show ========================================================================
set display+=lastline     " Display last line instead of @
set laststatus=2          " Show status line (we want a status line)
set showtabline=2         " Always show tab line
set magic                 " For regular expressions turn magic on
set title                 " Show title
set diffopt+=vertical     " Vertical diff
set acd                   " Vim will change the current working directory whenever you open a file

" Encoding ====================================================================
set encoding=utf8         " Default encoding
set termencoding=utf-8    " Terminal encoding
set fileencodings=utf8    " Supported file encodings

" Rules =======================================================================
set ruler                 " Always display cursor position
set autowrite             " Automatically save before commands like :next and :make
set noautochdir           " Change the current working directory whenever you open a file
set wildcharm=<Tab>

" Ignore files ================================================================
set secure exrc           " Allow load .vimrc or _vimrc from current directory
set shortmess+=I          " Don't display the intro message on starting Vim.
set modifiable		        " Will make a buffer modifiable
set pastetoggle=<F2>	    " Causes vim to enter insert mode and output a Q on it's own line
set runtimepath+=~/.dotf/vim/bundle/denite.nvim/
set runtimepath+=~/.dotf/vim/bundle/nvim-yarp/
set runtimepath+=~/.ditf/vim/bundle/vim-hug-neovim-rpc/
set runtimepath+=~/.dotf/vim/bundle/defx.nvim
set runtimepath+=~/vim/bundle/coc.nvim
set t_Co=256              " Set colors to 256
set runtimepath+=~/.fzf   " Once you have fzf installed, you can enable it inside Vim simply by adding the directory to
" &runtimepath in your Vim configuration file as follows:
set cursorline		      " Highlight the current line
set cursorcolumn	      " Highlight the current column
set completefunc=syntaxcomplete#Complete " Autocomplete
autocmd BufNewFile,BufRead *_test.rb set syntax=rspec
" Definitions, constants, and options
autocmd BufReadPre,BufNewFile * let b:did_vim_sass_colors = 1  "https://github.com/shmargum/vim-sass-colors
" Open hidden files from NerdTree or comment this line and press, shift + i), " when in the NerdTree window
highlight LineNr ctermfg=grey
set belloff=all " Bells are annoying
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
" Configure dictionary for autocompletion
set dictionary=/usr/share/dict/words
set gdefault              " Always do global substitutes
set infercase             " Smart casing when completing
set ignorecase            " Search in case-insensitively
set matchpairs=(:),{:},[:]"
set noexrc                " Disable reading of working directory vimrc files
set nojoinspaces          " No to double-spaces when joining lines
set nrformats=            " No to oct/hex support when doing CTRL-a/x
set path=**               " This is a list of directories which will be searched
set pumheight=35          " Height of complete list
set splitbelow            " Split below current window
set splitright            " Split window to the right
set textwidth=80          " Sets the maximum width of text that is being inserted.
set timeoutlen=2500       " Give some time for multi-key mappings
set spell spelllang=pt,en
set colorcolumn=80
" Absolute width of netrw window
let g:netrw_winsize = -28
" Do not display info on the top of window
let g:netrw_banner = 0
" Tree-view
let g:netrw_liststyle = 3
" Sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'
" Use the previous window to open file
let g:netrw_browse_split = 4
" Be aware, termguicolors results in `:terminal` colors that are slightly off.
" https://github.com/neovim/neovim/issues/7018
" Note: If you want to undenstand more settings about vimrc, plese access the
" path of vim/plugged/vimrc/plugin and open the file plug.vim
" Certain options only work in Neovim whilst others only work in Vim.
" Neovim has a Whitespace highlight group, Vim
if has("nvim")
    " Set 'guicursor' explicitly, needed for shape-changing to work in xterm.
    set inccommand=split
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
    set list
    set listchars=tab:\ \ ,trail:-
else
    set cryptmethod=blowfish2
    set listchars=eol:*,tab:>-,trail:-
    set ttymouse=xterm2
endif

if exists('g:loaded_vimrc') || &compatible
    finish
else
    let g:loaded_vimrc = 'yes'
endif

if has('gui_running')
    set guioptions=gc
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
    syntax sync minlines=256
endif

if has('mouse')
    set mouse=a          " Enable mouse support
    set mousemodel=popup " Use the mouse for copy/paste with pop up in gui vim
    set mousehide        " Hide cursor while typing
    if exists("$TMUX")
        if has('nvim')
            set inccommand=split
        endif
        if !has('nvim')
            " Tmux knows the extended mouse mode
            set ttymouse=xterm2
        endif
    endif
endif

if has("autocmd")
    filetype plugin indent on

    augroup vimrc
        au!

        " Remember cursor position
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                    \| exe "normal! g`\""
                    \| endif

        if exists('$TMUX')
            if !exists('$NORENAME') && !has('gui')
                " Automatic rename of tmux window
                " Set option set-option -g allow-rename off in ~/.tmux.conf
                au BufEnter * if empty(&buftype)
                            \| call system('tmux rename-window '.expand('%:t:S'))
                            \| endif
                au VimLeave * call system('tmux set-window automatic-rename on')
            endif
        endif
    augroup END
endif

if isdirectory('.git') && executable('git')
    set grepprg=git\ grep\ -nI
endif

if executable('ag') && !isdirectory('.git')
    " Silver searcher instead of grep
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c%m
endif

if &shell =~# 'fish$'
    " Avoid problems with fish shell.
    " https://github.com/tpope/vim-sensible/issues/50
    set shell=/bin/bash
endif

" ==============================================================================
"  Managers ---------------------------------------------------------------- {{{
" ==============================================================================
"  Managers Vim Plugs: Vim Plug,  Pathogen,  Vundle and  NeoBundle. It's up to
"  you  to  use. Currency, I use Vim Plug and Pathogen. However, it is up to up
"  you to use. They are all great.
"
" ==============================================================================
"                            Pathogen Settings
" ==============================================================================
" Pathogen begin
execute pathogen#infect()
" Pathogen end
