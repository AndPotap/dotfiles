" The instruction to download the plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
set runtimepath+=~/vim/
source ~/.config/nvim/maps.vim
setlocal cm=blowfish2
colorscheme gruv
set viminfo=
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set nocompatible
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd FileType tex set spell
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2
autocmd Filetype tex inoremap <C-J>  <Esc>/<++><Enter>"_c4l
autocmd Filetype tex nnoremap <C-J>  /<++><Enter>"_c4l
autocmd FileType tex inoremap <C-O> <C-G>u\left(\right)<++><Esc>10hi
autocmd FileType tex inoremap <C-Y> <C-G>u\left[\right]<++><Esc>10hi
autocmd FileType tex inoremap <C-S>s <C-G>u\sum_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>i <C-G>u\int_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>p <C-G>u\prod_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>f <C-G>u\frac{}{<++>}<++><Esc>10hi
autocmd FileType tex inoremap <C-S>b <C-G>u\mathbb{}<++><Esc>4hi
autocmd FileType tex inoremap <C-S>c <C-G>u\mathcal{}<++><Esc>4hi
autocmd FileType tex inoremap <C-S>r <C-G>u\mathrm{}<++><Esc>4hi
autocmd FileType tex imap <C-H> <C-G>u^{}<++><Esc>T{i
autocmd FileType tex imap <C-L> <C-G>u_{}<++><Esc>T{i
autocmd FileType tex imap ,4 <C-G>u$$<Space><++><Esc>5hi
autocmd FileType tex inoremap <C-F> <C-G>u$$<Space><++><Esc>5hi
autocmd FileType tex nnoremap <leader>q nop
autocmd FileType tex nnoremap <leader>qq :wq<Enter>
autocmd FileType tex nnoremap <leader>pa mavipgq`a:%s/\s\s/<Space><Enter>
autocmd FileType tex nmap <buffer> <leader>ee :!pdflatex % && clear<CR><CR>
autocmd FileType tex nmap <buffer> <leader>EE :!build_tex %:r.<CR>
autocmd FileType tex inoremap ,bb <C-G>u\textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bm <C-G>u\mathbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,em <C-G>u\emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,tt <C-G>u\texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,ii \item<Space>
autocmd FileType tex nnoremap ,4 o\begin{itemize}<Enter>\end{itemize}<Esc>ko<Space><Space>\item<Space><Space>
function AddItemize()
    normal ,4
    startinsert
endfunction
command Item call AddItemize()

autocmd FileType tex nnoremap ,3 o\begin{figure}<Esc>o\centering<Esc>o\includegraphics[<++>]{<++>}<Esc>o\caption{<++>}\label{<++>}<Esc>o\end{figure}<Esc>2k^/<++><CR>h
function AddFigure()
    normal ,3
    startinsert
endfunction
command Fig call AddFigure()

autocmd FileType tex nnoremap ,2 o\begin{equation}<Esc>o<Space><Space>\begin{split}<Enter>\end{split}<Enter>\end{equation}<Esc>^2X2k<leader>o<Space><Space><C-G>u
function AddEquation()
    normal ,2
    startinsert
endfunction
command Math call AddEquation()

autocmd FileType tex nnoremap ,1 i<C-G>u\textcolor{}{<++>}<Esc>T{2ha
function AddColor()
    normal ,1
    startinsert
endfunction
command Color call AddColor()

autocmd FileType tex nnoremap <leader>no i\noindent<Space>

autocmd FileType tex inoremap α <C-G>u\alpha
autocmd FileType tex inoremap β <C-G>u\beta
autocmd FileType tex inoremap ψ <C-G>u\psi
autocmd FileType tex inoremap δ <C-G>u\delta
autocmd FileType tex inoremap ε <C-G>u\epsilon
autocmd FileType tex inoremap φ <C-G>u\phi
autocmd FileType tex inoremap γ <C-G>u\gamma
autocmd FileType tex inoremap η <C-G>u\eta
autocmd FileType tex inoremap ι <C-G>u\iota
autocmd FileType tex inoremap ξ <C-G>u\xi
autocmd FileType tex inoremap κ <C-G>u\kappa
autocmd FileType tex inoremap λ <C-G>u\lambda
autocmd FileType tex inoremap μ <C-G>u\mu
autocmd FileType tex inoremap ν <C-G>u\nu
autocmd FileType tex inoremap π <C-G>u\pi
autocmd FileType tex inoremap ρ <C-G>u\rho
autocmd FileType tex inoremap σ <C-G>u\sigma
autocmd FileType tex inoremap θ <C-G>u\theta
autocmd FileType tex inoremap ς <C-G>u\varsigma
autocmd FileType tex inoremap ω <C-G>u\omega
autocmd FileType tex inoremap υ <C-G>u\upsilon
autocmd FileType tex inoremap ζ <C-G>u\zeta
autocmd FileType tex inoremap Γ <C-G>u\Gamma
autocmd FileType tex inoremap Δ <C-G>u\Delta
autocmd FileType tex inoremap Φ <C-G>u\Phi
autocmd FileType tex inoremap Ξ <C-G>u\Xi
autocmd FileType tex inoremap Λ <C-G>u\Lambda
autocmd FileType tex inoremap Π <C-G>u\Pi
autocmd FileType tex inoremap Σ <C-G>u\Sigma
autocmd FileType tex inoremap Θ <C-G>u\Theta
autocmd FileType tex inoremap Ω <C-G>u\Omega

autocmd FileType tex inoremap <C-G>a <C-G>u\alpha
autocmd FileType tex inoremap <C-G>b <C-G>u\beta
autocmd FileType tex inoremap <C-G>c <C-G>u\psi
autocmd FileType tex inoremap <C-G>d <C-G>u\delta
autocmd FileType tex inoremap <C-G>e <C-G>u\epsilon
autocmd FileType tex inoremap <C-G>f <C-G>u\phi
autocmd FileType tex inoremap <C-G>g <C-G>u\gamma
autocmd FileType tex inoremap <C-G>h <C-G>u\eta
autocmd FileType tex inoremap <C-G>i <C-G>u\iota
autocmd FileType tex inoremap <C-G>j <C-G>u\xi
autocmd FileType tex inoremap <C-G>k <C-G>u\kappa
autocmd FileType tex inoremap <C-G>l <C-G>u\lambda
autocmd FileType tex inoremap <C-G>m <C-G>u\mu
autocmd FileType tex inoremap <C-G>n <C-G>u\nu
autocmd FileType tex inoremap <C-G>p <C-G>u\pi
autocmd FileType tex inoremap <C-G>r <C-G>u\rho
autocmd FileType tex inoremap <C-G>s <C-G>u\sigma
autocmd FileType tex inoremap <C-G>w <C-G>u\varsigma
autocmd FileType tex inoremap <C-G>v <C-G>u\omega
autocmd FileType tex inoremap <C-G>y <C-G>u\upsilon
autocmd FileType tex inoremap <C-G>z <C-G>u\zeta
autocmd FileType tex inoremap <C-G>G <C-G>u\Gamma
autocmd FileType tex inoremap <C-G>D <C-G>u\Delta
autocmd FileType tex inoremap <C-G>P <C-G>u\Phi
autocmd FileType tex inoremap <C-G>J <C-G>u\Xi
autocmd FileType tex inoremap <C-G>L <C-G>u\Lambda
autocmd FileType tex inoremap <C-G>P <C-G>u\Pi
autocmd FileType tex inoremap <C-G>S <C-G>u\Sigma
autocmd FileType tex inoremap <C-G>V <C-G>u\Omega

