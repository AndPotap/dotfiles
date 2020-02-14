set runtimepath+=~/vim/
set nocompatible              " be iMproved, required
set noerrorbells
syntax on
colorscheme gruvbox
set nobackup noswapfile
set background=dark
set number
set relativenumber
set dictionary+=/usr/share/dict/words
set splitbelow splitright
inoremap HH <Esc>/<++><Enter>"_c4l
nmap <leader>H /<++><CR>"_c4l
let mapleader = " "
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>q :wq<Enter>
nnoremap <leader>Q :q!<Enter>
nnoremap <leader>w :w<Enter>
nmap <leader>Kk dt]
nmap <leader>KK dt}
noremap <leader>m `
nmap <leader>jj <C-W>j
nmap <leader>kk <C-W>k
nmap <leader>hh <C-W>h
nmap <leader>ll <C-W>l
inoremap <C-o> <C-x><C-p>
inoremap <C-k> <C-x><C-k>
inoremap <C-l> <C-x><C-k>
vnoremap <C-c> "*y
map <C-p> "*P
nnoremap ,z z=
nnoremap <leader>ss <C-D>
nnoremap <leader>aa <C-U>
nnoremap <leader>as <C-F>
nnoremap <leader>sa <C-B>
nnoremap <leader>sp :split<space>
nnoremap <leader>vp :vsplit<space>
nnoremap <leader>y "a
map <leader><space> ^
noremap <enter> $
nnoremap <leader>o o
" nnoremap o o<Esc>
nnoremap o $a<Enter><Esc>
nnoremap O O<Esc>
noremap , "
inoremap ; <esc>l
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
set backspace=2
set tw=100
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

autocmd BufWritePre * %s/\s\+$//e
autocmd FileType python map <silent> <leader>b A<Enter>import pdb<Enter>pdb.set_trace()<Esc>j^
autocmd FileType python nnoremap <leader>ff /def<Space><Enter>
autocmd FileType python nnoremap <leader>cc ^i# <Esc>j^
autocmd FileType python nnoremap <leader>un ^xxj^
autocmd FileType python nnoremap <leader>cl /class<Space><Enter>
autocmd FileType tex set spell
autocmd FileType text set spell
autocmd FileType tex nnoremap <leader>pa mavipgq`a:%s/\s\s/<Space><Enter>
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2
autocmd FileType tex nmap <buffer> <leader>ee :!pdflatex %<CR>
autocmd FileType tex nmap <buffer> <leader>EE :!build %<CR>
autocmd FileType tex inoremap ,bb \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tc \textcolor{red}{<++>}<Space><++><Esc>0/red<Enter>i
autocmd FileType tex map <leader>it A<Enter>\begin{itemize}<Esc><leader>o\end{itemize}<Esc>k<leader>o<Space><Space>\item<Space>
autocmd FileType tex map <leader>en A<Enter>\begin{enumerate}<Esc><leader>o\end{enumerate}<Esc>k<leader>o<Space><Space>\item<Space>
autocmd FileType tex inoremap ,ii \item<Space>
autocmd FileType tex map <leader>Sum a\sum_{<++>}^{<++>}<Space><++><Esc>16hi
autocmd FileType tex map <leader>fig a\begin{figure}<Esc>oi\centering<Esc>oi\includegraphics[<++>]{<++>}<Esc>oi\caption{<++>.}\label{}<Esc>oi\end{figure}<Esc>2k^/<++><CR>i
autocmd FileType tex map <leader>eq <leader>o\begin{equation*}<Esc><leader>o<Space><Space>\begin{split}<Enter>\end{split}<Enter>\end{equation*}<Esc>^2X2k<leader>o
autocmd FileType tex map <leader>fr a\frac{<++>}{<++>}<Space><++><Esc>15hi
autocmd FileType tex map <leader>red a\textcolor{red}{<++>}<Esc>4hi
autocmd FileType tex inoremap ,r ^{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,v _{}<++><Esc>T{i
autocmd FileType tex inoremap ,ff \left(
autocmd FileType tex inoremap ,jj \right)
autocmd FileType tex inoremap π \pi
autocmd FileType tex inoremap μ \mu
autocmd FileType tex inoremap ε \epsilon
autocmd FileType tex inoremap ξ \xi
autocmd FileType tex inoremap σ \sigma
autocmd FileType tex inoremap ς \varsigma
autocmd FileType tex inoremap ψ \psi
autocmd FileType tex inoremap τ \tau
autocmd FileType tex inoremap λ \lambda
autocmd FileType tex inoremap γ \gamma
autocmd FileType tex inoremap φ \phi
autocmd FileType tex inoremap δ \delta
autocmd FileType tex inoremap Δ \Delta

" autocmd VimLeave *.tex !texclean
