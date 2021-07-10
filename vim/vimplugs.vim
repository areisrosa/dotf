" =============================================================================
"  Vim Package Manager: Vim Plugs Settings ------------------------------ {{{
" =============================================================================

" Specify a directory for plugins
"  - For Neovim: stdpath('data') . '/plugged' (~/.local/share/nvim/plugged or 
"					       ~/.config/nvim/plugged)
"  - For Vim8: ~/.vim/plugged
"  - Avoid using standard Vim directory names like 'plugin'

" This file contains the list of plugin installed using vim-plug plugin manager.
" Once you've updated the list of plugin, you can run vim-plug update by issuing
" the command :PlugInstall from within vim.
" Filetype off is required by vim-plug

"filetype off

" Install the plugin manager if it doesn't exist

let s:plugin_manager=expand('~/.vim/autoload/plug.vim')
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
if empty(glob(s:plugin_manager))
    echom 'Vim-Plug not found. Installing...'
	if executable('curl')
		silent exec '!curl -fLo' . s:plugin_manager .' --create-dirs' .
					\ s:plugin_url
	elseif executable('wget')
		call mkdir(fnamemodify(s:plugin_manager,':h'),'p')
		silent exec  '!wget --force-directories --no-check-certificate -O' .
					\ expand(s:plugin_manager) .'' . s:plugin_url
	else
		echom  'Could not download plugin manager. No plugins were installed.'
		finish
	endif
	augroup vimplug
		autocmd!
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	augroup END
endif

let g:plug_dir = expand('~/.vim/plugged')

set rtp+=~/.vim/vimplugs/ "Submodules

call plug#begin(g:plug_dir)

" If you need Vim help for vim-plug itself (e.g. :help plug-options), register
" vim-plug as a plugin.
Plug 'junegunn/vim-plug'

" Dotf's vimplugs are split up by category into smaller files
" This reduces churn and makes it easier to fork. See
" ~/.vim/vimplugs/ to edit them:
runtime appearance.vimplug
runtime git.vimplug
runtime latex.vimplug
runtime navegation.vimplug
runtime languages.vimplug
runtime python.vimplug
runtime ruby.vimplug
runtime r.vimplug
runtime security.vimplug
runtime search.vimplug
runtime improvements.vimplug
runtime textobejcts.vimplug

" The plugs listed in ~/.vim/.vimplugs.local will be added here to
" allow the user to add vim plugs to dotfiles without the need for a fork.
if filereadable(expand('~/.dotf/vim/.vimplugs.local'))
  source ~/.dotf/vim/.vimplugs.local
endif

" Finalize vim-plug
call plug#end()
