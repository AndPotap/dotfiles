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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd FileType tex set spell
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2
autocmd Filetype tex inoremap <C-I>  <Esc>/<++><Enter>"_c4l
autocmd Filetype tex nnoremap <C-I>  /<++><Enter>"_c4l
autocmd FileType tex inoremap <C-O> <Esc>i\left(\right)<++><Esc>10hi
autocmd FileType tex inoremap <C-Y> <Esc>i\left[\right]<++><Esc>10hi
autocmd FileType tex inoremap <C-S>s <Esc>i\sum_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>i <Esc>i\int_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>p <Esc>i\prod_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap <C-S>f <Esc>i\frac{<++>}{<++>}<Space><++><Esc>15hi
autocmd FileType tex inoremap <C-H> <Esc>i^{}<++><Esc>T{i
autocmd FileType tex inoremap <C-L> <Esc>i_{}<++><Esc>T{i
autocmd FileType tex inoremap ,4 $$<Space><++><Esc>5hi
autocmd FileType tex nnoremap <leader>q nop
autocmd FileType tex nnoremap <leader>qq :wq<Enter>
autocmd FileType tex nnoremap <leader>pa mavipgq`a:%s/\s\s/<Space><Enter>
autocmd FileType tex nmap <buffer> <leader>ee :!pdflatex % <CR><CR>
autocmd FileType tex nmap <buffer> <leader>EE :!build_tex %:r.<CR>
autocmd FileType tex inoremap ,bb \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,ii \item<Space>
autocmd FileType tex inoremap ,it \begin{itemize}<Enter>\end{itemize}<Esc>2k<leader>o<Space><Space>\item<Space>
autocmd FileType tex map <leader>en A<Enter>\begin{enumerate}<Esc><leader>o\end{enumerate}<Esc>k<leader>o<Space><Space>\item<Space>
autocmd FileType tex map <leader>fig a\begin{figure}<Esc>oi\centering<Esc>oi\includegraphics[<++>]{<++>}<Esc>oi\caption{<++>.}\label{}<Esc>oi\end{figure}<Esc>2k^/<++><CR>i
autocmd FileType tex map <leader>eq <leader>o\begin{equation}<Esc><leader>o<Space><Space>\begin{split}<Enter>\end{split}<Enter>\end{equation}<Esc>^2X2k<leader>o<Space><Space>
autocmd FileType tex map <leader>red i\textcolor{red}{<++>}<Esc>4hi
autocmd FileType tex nnoremap <leader>no i\noindent<Space>
autocmd FileType tex inoremap <C-G>a \alpha
autocmd FileType tex inoremap <C-G>b \beta
autocmd FileType tex inoremap <C-G>g \gamma
autocmd FileType tex inoremap <C-G>d \delta
autocmd FileType tex inoremap <C-G>m \mu
autocmd FileType tex inoremap <C-G>n \nu
autocmd FileType tex inoremap <C-G>e \epsilon
autocmd FileType tex inoremap <C-G>x \xi
autocmd FileType tex inoremap <C-G>s \sigma
autocmd FileType tex inoremap <C-G>p \psi
autocmd FileType tex inoremap <C-G>h \eta
autocmd FileType tex inoremap <C-G>y \theta
autocmd FileType tex inoremap <C-G>u \phi
autocmd FileType tex inoremap <C-G>t \tau
autocmd FileType tex inoremap <C-G>l \lambda

autocmd FileType tex inoremap <C-G>A \Alpha
autocmd FileType tex inoremap <C-G>B \Beta
autocmd FileType tex inoremap <C-G>G \Gamma
autocmd FileType tex inoremap <C-G>D \Delta
autocmd FileType tex inoremap <C-G>M \Mu
autocmd FileType tex inoremap <C-G>N \Nu
autocmd FileType tex inoremap <C-G>E \Epsilon
autocmd FileType tex inoremap <C-G>X \Xi
autocmd FileType tex inoremap <C-G>S \Sigma
autocmd FileType tex inoremap <C-G>P \Psi
autocmd FileType tex inoremap <C-G>H \Eta
autocmd FileType tex inoremap <C-G>Y \Theta
autocmd FileType tex inoremap <U \Phi
autocmd FileType tex inoremap <T \Tau
autocmd FileType tex inoremap <L \Lambda
