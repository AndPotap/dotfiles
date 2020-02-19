set runtimepath+=~/vim/
source ~/.config/nvim/maps.vim
autocmd FileType tex set spell
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
