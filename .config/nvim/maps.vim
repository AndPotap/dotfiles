syntax on
source ~/.config/nvim/latex.vim
" autocmd BufWritePre * %s/\s\+$//e
" Basic settings --- {{{
let mapleader = " "
set mouse=
set wildignorecase
set signcolumn=yes
" let $PAGER=''
let $MANPAGER=''
set background=dark
set nowrap noerrorbells nohlsearch ignorecase
set clipboard=unnamed
set wildmode=longest,list
set number relativenumber splitbelow splitright
set nobackup noswapfile nowritebackup
set textwidth=89 backspace=2 tabstop=4
set softtabstop=4 shiftwidth=4 expandtab autoindent
set fileformat=unix
set colorcolumn=50,100
set cursorline
set scrolloff=7
" --- }}}
" Commands inspired by book XXX ------------------ {{{
onoremap p i(
onoremap il( :<C-U>normal! F)vi(<CR>
    " Operator pending mappings
onoremap ih :<C-U> execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
iabbrev waht what
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
nnoremap <space> <nop>
" }}}
" Normal model remaps --- {{{
nnoremap <silent> <C-L> :syntax sync fromstart <CR>
nnoremap <silent> * *N
" nnoremap M 050l
nnoremap <silent> M :call cursor(0, 50)<CR>
nnoremap <silent> T :call cursor(0, 100)<CR>
nnoremap <C-Y> "+y
vnoremap <C-Y> "+y
imap ; <esc>l
inoremap <C-j> :<Esc>r;a
nnoremap ,z z=
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>q :wq<Enter>
nnoremap <leader>Q :q!<Enter>
nnoremap <leader>w :w<Enter>
nnoremap <leader>o o
nnoremap o o<Esc>
nnoremap O O<Esc>
nnoremap <leader>Kk dt]
nnoremap <leader>KK dt}
nnoremap <leader>ZZ dt_
nnoremap <leader>m `
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>t <C-W>li
nnoremap <leader>rl <C-w>L
nnoremap <leader>rh <C-w>H
nnoremap <leader>rj <C-w>J
nnoremap <leader>rk <C-w>K
noremap <leader><space> ^
noremap <enter> $
nnoremap <C-S>m :set formatoptions+=w<CR>gggqG
nnoremap <C-S>u :set formatoptions+=w textwidth=9999<CR>gggqG
" --- }}}
" Insert mode remaps --- {{{
inoremap ; <esc>l
inoremap <C-j> :<Esc>r;a
inoremap <C-o> <C-x><C-p>
inoremap <C-l> <C-x><C-k>
inoremap TT `
inoremap EE \|
inoremap AA ~
inoremap ZZ _
inoremap Dd -
inoremap FF =
inoremap DD +
inoremap QQ '
inoremap Qq "
inoremap Jj [
inoremap Kk ]
inoremap JJ {
inoremap KK }
inoremap ,f \
" --- }}}
" Nop remappings --- {{{
nnoremap Q <Nop>
vnoremap <C-U> <Nop>
" --- }}}
" Cmaps --- {{{
cmap TT `
cmap RR \|
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
cmap ,f \
" --- }}}
" Terminal maps --- {{{
tnoremap <Esc> <C-\><C-n><C-W>h
tnoremap ZZ _
tnoremap RR \|
tnoremap Dd -
tnoremap FF =
tnoremap DD +
tnoremap QQ '
tnoremap Qq "
tnoremap Jj [
tnoremap Kk ]
tnoremap JJ {
tnoremap KK }
tnoremap ,f \
" --- }}}

" function! SaveLastReg()
"     if v:event['regname']==""
"         if v:event['operator']=='d'
"             for i in range(8,1,-1)
"                 exe "let @".string(i+1)." = @". string(i)
"             endfor
"             if exists("g:last_yank")
"                 let @1=g:last_yank
"             endif
"             let g:last_yank=@"
"         endif
"     endif
" endfunction
"
" autocmd TextYankPost * call SaveLastReg()

nnoremap ,? <C-W>=
function EqualizePanes()
    normal ,?
endfunction
command Eq call EqualizePanes()
"
" Commands for GPG. ---------- {{{
" By Wouter Hanegraaff
augroup encrypted
    au!
    autocmd BufRead *.gpg set filetype=gpg
    autocmd BufRead *.gpg set columns=100
    autocmd FileType gpg set wrap linebreak textwidth=0 wrapmargin=0
    " autocmd FileType gpg cmap w <nop>
    autocmd FileType gpg vnoremap <Down> gj
    autocmd FileType gpg vnoremap <Up> gk
    " autocmd FileType gpg nnoremap <Down> gj
    " autocmd FileType gpg nnoremap <Up> gk
    autocmd FileType gpg nnoremap j gj
    autocmd FileType gpg nnoremap k gk
    autocmd FileType gpg set spell syntax=txt
    autocmd FileType gpg nnoremap <leader>cl mJ/%%%%<cr>`J
    autocmd FileType gpg nnoremap <leader>ff mJ/##<cr>`J
    autocmd FileType gpg nnoremap<leader>w mxHmw:w<Enter><Enter>'wzt`x
    " First make sure nothing is written to ~/.viminfo while editing an encrypted file.
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
" ----- }}}
"
" Commands for ASC. ---------- {{{
" Same as above but different ending
augroup ASCEncrypt
    au!
    autocmd BufRead *.asc set filetype=asc
    autocmd BufRead *.asc set columns=100
    autocmd FileType asc set wrap linebreak textwidth=0 wrapmargin=0
    autocmd FileType asc vnoremap <Down> gj
    autocmd FileType asc vnoremap <Up> gk
    autocmd FileType asc nnoremap j gj
    autocmd FileType asc nnoremap k gk
    autocmd FileType asc set spell syntax=txt
    autocmd FileType asc nnoremap <leader>cl mJ/%%%%<cr>`J
    autocmd FileType asc nnoremap <leader>ff mJ/##<cr>`J
    autocmd FileType asc nnoremap<leader>w mxHmw:w<Enter><Enter>'wzt`x
    autocmd BufReadPre,FileReadPre *.asc !gpg-connect-agent reloadagent /bye
    autocmd BufReadPre,FileReadPre *.asc set viminfo=
    autocmd BufReadPre,FileReadPre *.asc set noswapfile noundofile nobackup
    autocmd BufReadPre,FileReadPre *.asc set bin
    autocmd BufReadPre,FileReadPre *.asc let ch_save = &ch|set ch=2
    autocmd BufReadPost,FileReadPost *.asc '[,']!gpg -r ubuntu --decrypt 2> /dev/null
    autocmd BufReadPost,FileReadPost *.asc set nobin
    autocmd BufReadPost,FileReadPost *.asc let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.asc execute ":doautocmd BufReadPost " . expand("%:r")
    autocmd BufReadPost,FileReadPost *.asc !gpg-connect-agent reloadagent /bye
    autocmd BufWritePre,FileWritePre *.asc '[,']!gpg -r ubuntu -ae 2>/dev/null
    autocmd BufWritePost,FileWritePost *.asc u
augroup END
" ----- }}}

" Commands for Text  ---- {{{
augroup text
    autocmd FileType text nnoremap <leader>0 %s/\s\+$//e
    autocmd FileType text set spell syntax=txt
    autocmd FileType text nnoremap <leader>cl /%%%%<cr>
    autocmd FileType text nnoremap <leader>ff /##<cr>
augroup END
" --- }}}
"
" Commands for sh  ---- {{{
augroup sh_file
    autocmd BufRead *.sh set filetype=sh
    autocmd FileType sh setlocal textwidth=599
augroup END
" --- }}}

" Commands for VIM ----- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" ----- }}}

" Commands for Python ---- {{{
augroup pythonops
    autocmd FileType python map <silent> <leader>b A<Enter>breakpoint()<Esc>j^
    autocmd FileType python nnoremap <leader>ff /def<Space><Enter>
    autocmd FileType python nnoremap <leader>cl /class<Space><Enter>
    autocmd FileType python nnoremap <leader>cc ^<C-V>I#<Space><Esc>j^
    autocmd FileType python nnoremap <leader>un ^xxj^
    autocmd FileType python vnoremap <silent> # :s/^/#<Space><cr>:noh<cr>
    autocmd FileType python vnoremap <silent> ! :s/^#<Space>//<cr>:noh<cr>
    " autocmd FileType python source ~/.config/nvim/colors/gruv.vim
    "     " For highlight changes to take place run below
    " autocmd FileType python hi! Normal ctermbg=NONE guibg=NONE
    " autocmd FileType python hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
augroup END
" ----- }}}
