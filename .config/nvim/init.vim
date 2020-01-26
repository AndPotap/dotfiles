call plug#begin('~/.vim/plugged')
    Plug 'davidhalter/jedi-vim'
    Plug 'jpalardy/vim-slime'
    Plug 'morhetz/gruvbox'
    Plug 'dense-analysis/ale'
    Plug 'Chiel92/vim-autoformat'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    "Plug 'habamax/vim-sendtoterm'
call plug#end()

let g:python3_host_prog="/home/pure/anaconda3/bin/python3.7"

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Slime Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_dont_ask_default=1
nmap <C-u> <Plug>SlimeLineSend
nmap <C-i> <Plug>SlimeParagraphSend
xmap <C-i> <Plug>SlimeRegionSend

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Airline Configurations
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Jedi-Vim Configurations
let g:jedi#completions_command = "<C-l>"
let g:jedi#goto_stubs_command = ""
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'
let g:jedi#enable_speed_debugging=0
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
let g:ncm2_jedi#python_version = 3

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Ale Configurations
let g:ale_linters = {'python': ['flake8']}
"let g:ale_linters_explicit = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

" :::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My NVIM/VIM configurations
set noerrorbells
set nohlsearch
set clipboard=unnamed
syntax on
colorscheme gruvbox
set wildmode=longest,list
set background=dark
set number
set relativenumber
set dictionary+=/usr/share/dict/words
set splitbelow splitright
set nobackup noswapfile
inoremap HH <Esc>/<++><Enter>"_c4l
nmap <leader>H /<++><CR>"_c4l
let mapleader = " "
nnoremap ,z z=
nnoremap <leader>for :Autoformat<Enter>
xmap <leader>r  <Plug>(SendToTerm)
nmap <leader>r  <Plug>(SendToTerm)
omap <leader>r  <Plug>(SendToTerm)
nmap <leader>rr <Plug>(SendToTermLine)
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>q :wq<Enter>
nnoremap <leader>Q :q!<Enter>
nnoremap <leader>w :w<Enter>
tnoremap <Esc> <C-\><C-n><C-W>h
nmap <leader>Kk dt]
nmap <leader>KK dt}
noremap <leader>m `
nmap <leader>jj <C-W>j
nmap <leader>kk <C-W>k
nmap <leader>hh <C-W>h
nmap <leader>ll <C-W>l
inoremap <C-o> <C-x><C-p>
nnoremap <leader>ss <C-D>
nnoremap <leader>aa <C-U>
nnoremap <leader>as <C-F>
nnoremap <leader>sa <C-B>
nnoremap <leader>sp :split<space>
nnoremap <leader>vv :vsplit<space>
nnoremap <leader>y "a
nmap <leader>t <C-W>li
map <leader><space> ^
noremap <enter> $
nnoremap <leader>o o
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
imap AA ~
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
set textwidth=110
set expandtab
set autoindent
autocmd BufWritePre * %s/\s\+$//e
autocmd ExitPre *.txt :!git commit % -q -m "Added Entry" && git push -q &
autocmd FileType text set spell
autocmd FileType python map <silent> <leader>b A<Enter>import pdb<Enter>pdb.set_trace()<Esc>j^
autocmd FileType python nnoremap <leader>ff /def<Space><Enter>
autocmd FileType python nnoremap <leader>cc ^i# <Esc>j^
autocmd FileType python nnoremap <leader>un ^xxj^
autocmd FileType python nnoremap <leader>cl /class<Space><Enter>
" For highlight changes to take place run below
autocmd FileType python source ~/.vim/plugged/gruvbox/colors/gruvbox.vim
