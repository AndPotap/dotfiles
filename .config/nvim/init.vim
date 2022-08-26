set runtimepath+=~/.config/nvim/
source ~/.config/nvim/maps.vim

lua << EOF
require('ap.plugins')
require('ap.cmp')
require('ap.lsp')
require('ap.tree')
require('ap.signature')
require('ap.telescope')
EOF

set bg=dark
colorscheme gruvbox

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Slime
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": "default", "target_pane": "{last}"}
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_dont_ask_default=1
let g:slime_python_ipython = 1
nnoremap <C-i> <Plug>SlimeLineSend
nnoremap <C-q> <Plug>SlimeParagraphSend
xnoremap <C-i> <Plug>SlimeRegionSend

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Airline
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
