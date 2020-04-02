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
autocmd FileType tex nnoremap <leader>q nop
autocmd FileType tex nnoremap <leader>qq :wq<Enter>
autocmd FileType tex nnoremap <leader>pa mavipgq`a:%s/\s\s/<Space><Enter>
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2
autocmd FileType tex nmap <buffer> <leader>ee :!pdflatex % <CR><CR>
autocmd FileType tex nmap <buffer> <leader>EE :!build_tex %:r.<CR>
autocmd FileType tex inoremap ,bb \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tc \textcolor{red}{<++>}<Space><++><Esc>0/red<Enter>i
autocmd FileType tex inoremap ,it \begin{itemize}<Enter>\end{itemize}<Esc>2k<leader>o<Space><Space>\item<Space>
autocmd FileType tex map <leader>en A<Enter>\begin{enumerate}<Esc><leader>o\end{enumerate}<Esc>k<leader>o<Space><Space>\item<Space>
autocmd FileType tex inoremap ,ii \item<Space>
autocmd FileType tex map <leader>Sum a\sum_{<++>}^{<++>}<Space><++><Esc>16hi
autocmd FileType tex map <leader>fig a\begin{figure}<Esc>oi\centering<Esc>oi\includegraphics[<++>]{<++>}<Esc>oi\caption{<++>.}\label{}<Esc>oi\end{figure}<Esc>2k^/<++><CR>i
autocmd FileType tex map <leader>eq <leader>o\begin{equation}<Esc><leader>o<Space><Space>\begin{split}<Enter>\end{split}<Enter>\end{equation}<Esc>^2X2k<leader>o<Space><Space>
autocmd FileType tex inoremap ,fr \frac{<++>}{<++>}<Space><++><Esc>15hi
autocmd FileType tex map <leader>red a\textcolor{red}{<++>}<Esc>4hi
autocmd FileType tex inoremap ,u ^{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,l _{}<++><Esc>T{i
autocmd FileType tex inoremap ,ff \left(<Space>\right)<Space><++><Esc>12hi
autocmd FileType tex inoremap ,4 $$<Space><++><Esc>5hi
autocmd FileType tex inoremap ,su \sum_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex inoremap ,in \int_{<++>}^{<++>} <++><Esc>2T{i
autocmd FileType tex nnoremap <leader>no i\noindent<Space><Esc>
autocmd FileType tex inoremap <a \alpha
autocmd FileType tex inoremap <b \beta
autocmd FileType tex inoremap <g \gamma
autocmd FileType tex inoremap <G \Gamma
autocmd FileType tex inoremap <d \delta
autocmd FileType tex inoremap <p \pi
autocmd FileType tex inoremap <m \mu
autocmd FileType tex inoremap <n \nu
autocmd FileType tex inoremap <N \Nu
autocmd FileType tex inoremap <e \epsilon
autocmd FileType tex inoremap <x \xi
autocmd FileType tex inoremap <s \sigma
autocmd FileType tex inoremap <p \psi
autocmd FileType tex inoremap <h \eta
autocmd FileType tex inoremap <y \theta
autocmd FileType tex inoremap <u \phi
autocmd FileType tex inoremap <P \phi
autocmd FileType tex inoremap <t \tau
autocmd FileType tex inoremap <l \lambda
autocmd FileType tex inoremap <D \Delta
