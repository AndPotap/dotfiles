local grp = vim.api.nvim_create_augroup("pythonops", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

local function python_keys()
    map('n', '<leader>b', 'A<Enter>breakpoint()<Esc>')
    map('n', '<leader>ff', '/def<Space><Enter>')
    map('n', '<leader>cl', '/class<Space><Enter>')
    map('n', '<leader>cc', '^<C-V>I#<Space><Esc>j^')
    map('n', '<leader>un', '^xxj^')
end

autocmd("FileType", { pattern = { "python" },
    callback = python_keys,
    group = grp
})

vim.cmd([[
augroup encrypted
    au!
    autocmd BufRead *.gpg set filetype=gpg
    autocmd BufRead *.gpg set columns=100
    autocmd FileType gpg set wrap linebreak textwidth=0 wrapmargin=0
    " autocmd FileType gpg cmap w <nop>
    autocmd FileType gpg vnoremap <Down> gj
    autocmd FileType gpg vnoremap <Up> gk
    autocmd FileType gpg nnoremap <Down> gj
    autocmd FileType gpg nnoremap <Up> gk
    autocmd FileType gpg set spell syntax=txt
    autocmd FileType gpg nnoremap <leader>cl /%%%%<cr>
    autocmd FileType gpg nnoremap <leader>ff /##<cr>
    autocmd FileType gpg nnoremap<leader>w mxHmw:w<Enter><Enter>'wzt`x
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
    " autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg ubuntu -ae 2>/dev/null
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost *.gpg u
augroup END
]])
