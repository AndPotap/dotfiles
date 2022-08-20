set runtimepath+=~/vim/
set paste
source ~/.config/nvim/maps.vim
colorscheme gruv
set viminfo=
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set nocompatible
set complete+=i
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd FileType tex set spell
autocmd FileType tex set tabstop=2
autocmd FileType tex set softtabstop=2
autocmd FileType tex set shiftwidth=2
