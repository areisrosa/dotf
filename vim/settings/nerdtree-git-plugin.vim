"-------------------------------------------------------------------------------------------------------------------------------
" Customizing Symbols: NERDTree Git Plug Settings
" "
" " Note: A plugin of NERDTree showing git status flags. Works with the LATEST version of NERDTree.
" ------------------------------------------------------------------------------------------------------------------------------
"
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \"Modified"  :"±",
            \"Staged"    :"⇆",
            \"Untracked" :"?",
            \"Renamed"   :"➜",
            \"Unmerged"  :"═",
            \"Deleted"   :"✖",
            \"Dirty"     :"✗",
            \"Clean"     :"✔︎",
            \'Ignored'   :'☒',
            \"Unknown"   :"?"
            \ }
let g:NERDTreeGitStatusUpdateOnCursorHold = 0
let g:NERDTreeGitStatusIndicatorMapCustom = 0
" Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline,
" This adds syntax for nerdtree on most common file extensions.
