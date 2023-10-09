" Commands for GPG. ---------- {{{
" By Wouter Hanegraaff
augroup encrypted
    au!
    autocmd BufRead *.gpg set filetype=gpg
    autocmd BufRead *.gpg set columns=150
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

" Commands for Bib ---- {{{
augroup references
    autocmd BufRead *.bib set filetype=bib
    autocmd FileType bib let @/ = "+++"
    autocmd FileType bib let @n = "Advances in Neural Information Processing Systems (NeurIPS)"
    autocmd FileType bib let @i = "International Conference on Machine Learning (ICML)"
    autocmd FileType bib let @a = "International Conference on Artificial Intelligence and Statistics (AISTATS)"
    autocmd FileType bib let @c = "International Conference on Learning Representations (ICLR)"
augroup END
" ----- }}}
