let mapleader = " "
syntax on
colorscheme gruvbox
set dictionary+=/usr/share/dict/words
set noerrorbells
set nohlsearch
set ignorecase
set clipboard=unnamed
set wildmode=longest,list
set background=dark
set number relativenumber
set splitbelow splitright
set nobackup noswapfile nowritebackup
set backspace=2
set tw=100
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=110
set expandtab autoindent
inoremap ; <esc>l
inoremap HH <Esc>/<++><Enter>"_c4l
nmap <leader>H /<++><CR>"_c4l
nnoremap ,z z=
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>q :wq<Enter>
nnoremap <leader>Q :q!<Enter>
nnoremap <leader>o o
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap Q <Nop>
inoremap <C-l> <C-x><C-k>
nnoremap <leader>w :w<Enter>
nmap <leader>Kk dt]
nmap <leader>KK dt}
nmap <leader>Z ct_
nnoremap <leader>m `
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l
nmap <leader>t <C-W>li
nnoremap <leader>rl <C-w>L
nnoremap <leader>rh <C-w>H
nnoremap <leader>rj <C-w>J
nnoremap <leader>rk <C-w>K
inoremap <C-o> <C-x><C-p>
nnoremap S Mzt2k2j
nnoremap U zbM
nnoremap <leader>D <C-F>
nnoremap <leader>U <C-B>H
nnoremap <leader>sp :split<space>
nnoremap <leader>vp :vsplit<space>
nnoremap <leader>y "a
map <leader><space> ^
noremap <enter> $
imap TT `
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
cmap TT `
cmap AA ~
cmap ZZ _
cmap Dd -
cmap FF =
cmap DD +
cmap QQ '
cmap Jj [
cmap Kk ]
cmap JJ {
cmap KK }
cmap SS \
tnoremap <Esc> <C-\><C-n><C-W>h
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