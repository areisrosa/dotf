" =============================================================================
" Functions --------------------------------------------------------------- {{{
" =============================================================================

" Set default value for the global variables.
let g:listMode = 1

" After adding a word to 'spellfile' with the above commands its associated
" '.spl' file will automatically be updated and reloaded. If you change
" 'spellfile' manually you need to use the |:mkspell| command. This sequence of
" commands mostly works well:
" :edit <spellfile; e.g. en.utf-8.add>
" (make changes to the spell file)
" :mkspell! %

" Toggle spelling mode and add the dictionary to the completion list of
" sources if spelling mode has been entered, otherwise remove it when
" leaving spelling mode.
function! Spelling()
    setlocal spell!
    if &spell
        set complete+=kspell
        set spelllang=pt,en spelllang? " Spell languages (english,portuguese)
        echo "Spell mode enabled"
    else
        set complete-=kspell
        echo "Spell mode disabled"
    endif
endfunction

" Toggle the highlighting of special characters.
function! Listing()
    if &filetype == "go"
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link SpecialKey Function
            highlight! link Whitespace Function
            let g:listMode = 0
        else
            " Mimic indentLine plugin markers for tab-indented Go code.
            set listchars=tab:\┊\ ,trail:-
            highlight! link SpecialKey Conceal
            highlight! link Whitespace Conceal
            let g:listMode = 1
        endif
        return
    endif
    " Note, Neovim has a Whitespace highlight group, Vim does not.
    if has("nvim")
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link Whitespace Function
            let g:listMode = 0
        else
            set listchars=tab:\ \ ,trail:-
            highlight! link Whitespace Conceal
            let g:listMode = 1
        endif
    else
        set list!
    endif
endfunction

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
