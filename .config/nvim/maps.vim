let mapleader = " "
syntax on
set background=dark
set noerrorbells
set nohlsearch
set ignorecase
set clipboard=unnamed
set wildmode=longest,list
set number relativenumber
set splitbelow splitright
set nobackup noswapfile nowritebackup
set textwidth=100
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab autoindent
nnoremap <leader>1p ""p
nnoremap <leader>1P ""P
nnoremap <leader>2p "0p
nnoremap <leader>2P "0P
nnoremap <leader>3p "1p
nnoremap <leader>3P "1P
nnoremap <leader>4p "2p
nnoremap <leader>4P "2P
nnoremap <leader>5p "3p
nnoremap <leader>5P "3P
" Reload syntax"
nnoremap <silent> <C-L> :syntax sync fromstart <CR>
imap ; <esc>l
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
nmap <leader>ZZ dt_
nmap <C-S>m :set formatoptions+=w<CR>gggqG
nmap <C-S>u :set formatoptions+=w textwidth=9999<CR>gggqG
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
map <leader><space> ^
noremap <enter> $
imap TT `
imap AA ~
imap ZZ _
imap Dd -
imap FF =
imap DD +
imap QQ '
imap Qq "
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
cmap Qq "
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
tnoremap Qq "
tnoremap Jj [
tnoremap Kk ]
tnoremap JJ {
tnoremap KK }
tnoremap SS \

nnoremap ,? <C-W>=
function EqualizePanes()
    normal ,?
endfunction
command Eq call EqualizePanes()


" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
    au!
    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    " We don't want a various options which write unencrypted data to disk
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.gpg set bin
    autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg set nobin
    autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

    " Convert all text to encrypted text before writing
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost *.gpg u
augroup END

autocmd BufWritePre * %s/\s\+$//e
autocmd FileType text set spell syntax=txt
autocmd FileType text nnoremap <leader>cl /%%%%<cr>
autocmd FileType text nnoremap <leader>ff /##<cr>
autocmd BufRead *.gpg set filetype=gpg
autocmd FileType gpg set spell syntax=txt
autocmd FileType gpg nnoremap <leader>cl /%%%%<cr>
autocmd FileType gpg nnoremap <leader>ff /##<cr>
autocmd FileType gpg nnoremap<leader>w mxHmw:w<Enter><Enter>'wzt`x
autocmd FileType python map <silent> <leader>b A<Enter>breakpoint()<Esc>j^
autocmd FileType python nnoremap <leader>ff /def<Space><Enter>
autocmd FileType python nnoremap <leader>cl /class<Space><Enter>
autocmd FileType python nnoremap <leader>cc ^<C-V>I#<Space><Esc>j^
autocmd FileType python nnoremap <leader>un ^xxj^
autocmd FileType python vnoremap <silent> # :s/^/#<Space><cr>:noh<cr>
autocmd FileType python vnoremap <silent> ! :s/^#<Space>//<cr>:noh<cr>
" For highlight changes to take place run below
autocmd FileType python source ~/.config/nvim/colors/gruv.vim
autocmd FileType python hi! Normal ctermbg=NONE guibg=NONE
autocmd FileType python hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
