call plug#begin('~/.vim/plugged')
    Plug 'davidhalter/jedi-vim'
    Plug 'jpalardy/vim-slime'
    Plug 'morhetz/gruvbox'
    Plug 'w0rp/ale'
    Plug 'Chiel92/vim-autoformat'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    Plug 'habamax/vim-sendtoterm'
call plug#end()

let g:python3_host_prog="/usr/bin/python3"

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Slime Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_dont_ask_default=1
nmap <C-u> <Plug>SlimeLineSend

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Airline Configurations
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Jedi-Vim Configurations
let g:jedi#completions_command = "<C-l>"
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#use_splits_not_buffers = "right"

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" ncm2 Configurations
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let g:ncm2#matcher = 'substrfuzzy'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Ale Configurations
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_python_flake8_options = '--ignore=E129'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'

" :::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My NVIM/VIM configurations
set noerrorbells
set nohlsearch
syntax on
colorscheme gruvbox
set background=dark
set number
set relativenumber
set dictionary+=/usr/share/dict/words
set splitbelow splitright
set nobackup noswapfile
inoremap HH <Esc>/<++><Enter>"_c4l
nmap <leader>H /<++><CR>"_c4l
let mapleader = " "
xmap <leader>r  <Plug>(SendToTerm)
nmap <leader>r  <Plug>(SendToTerm)
omap <leader>r  <Plug>(SendToTerm)
nmap <leader>rr <Plug>(SendToTermLine)
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
tnoremap <Esc> <C-\><C-n><C-W>h
nmap <leader>Kk dt]
nmap <leader>KK dt}
noremap <leader>m `
nmap <leader>jj <C-W>j
nmap <leader>kk <C-W>k
nmap <leader>hh <C-W>h
nmap <leader>ll <C-W>l
inoremap <C-o> <C-x><C-p>
nnoremap <leader>s <C-D>
nnoremap <leader>a <C-U>
nmap <leader>t <C-W>li
" vnoremap <C-c> "*y
" map <C-p> "*P
map <leader><space> ^
noremap <enter> $
nnoremap <leader>o o<Space><Esc>
nnoremap o o<Esc>
nnoremap O O<Esc>
noremap , "
inoremap ; <esc>l
tnoremap ZZ _
tnoremap Dd -
tnoremap FF =
tnoremap DD +
tnoremap QQ '
tnoremap Jj [
tnoremap Kk ]
tnoremap JJ {
tnoremap KK }
tnoremap SS \
imap ZZ _
imap Dd -
imap FF =
imap DD +
imap QQ '
imap Jj [
imap Kk ]
imap JJ {
imap KK }
imap SS \
set backspace=2
set tw=100
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType python map <silent> <leader>b koibreakpoint()<Esc>j^

autocmd FileType python source ~/.vim/plugged/gruvbox/colors/gruvbox.vim
