" ,mpl = markdown preview
let g:livedown_autorun = 0
" should the browser window pop-up upon previewing
let g:livedown_open = 1
" the port on which Livedown server will run
let g:livedown_port = 1337
" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"
"let g:livedown_browser = "google-chrome"

map <silent> ,mplp   :LivedownPreview<CR>
map <silent> ,mplt   :LivedownToggle<CR>
map <silent> ,mplk   :LivedownKill<CR>


