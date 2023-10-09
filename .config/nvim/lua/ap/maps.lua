vim.opt.textwidth = 100
vim.opt.clipboard = 'unnamed'
vim.o.mouse = ""
vim.g.mapleader = " "
vim.wo.signcolumn = "yes"
vim.opt.wildignorecase = true
vim.env.MANPAGER = ''
vim.opt.background = 'dark'
vim.opt.wrap = false
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.wildmode = 'longest,list'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backspace = '2'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileformat = 'unix'
vim.opt.colorcolumn = '50,100'
vim.opt.cursorline = true
vim.opt.scrolloff = 7

-- nnoremap <silent> <C-L> :syntax sync fromstart <CR>
-- nnoremap <silent> * *N
-- nnoremap <silent> M :call cursor(0, 50)<CR>
-- nnoremap <silent> T :call cursor(0, 100)<CR>

vim.keymap.set("v", "<Enter>", "$", { noremap = true })

local n_pairs = {
    ["<Enter>"] = "$",
    [",z"] = "z=",
    [",?"] = "<C-W>=",
    ["<C-Y>"] = "+y",
    ["tn"] = ":tabnew<Space>",
    ["tk"] = ":tabnext<CR>",
    ["tj"] = ":tabprev<CR>",
    ["th"] = ":tabfirst<CR>",
    ["tl"] = ":tablast<CR>",
    ["<leader>q"] = ":wq<Enter>",
    ["<leader>Q"] = ":q!<Enter>",
    ["<leader>w"] = ":w<Enter>",
    ["<leader>o"] = "o",
    ["o"] = "o<Esc>",
    ["O"] = "O<Esc>",
    ["<leader>Kk"] = "dt]",
    ["<leader>KK"] = "dt}",
    ["<leader>ZZ"] = "dt_",
    ["<leader>m"] = "`",
    ["<leader>j"] = "<C-W>j",
    ["<leader>k"] = "<C-W>k",
    ["<leader>h"] = "<C-W>h",
    ["<leader>l"] = "<C-W>l",
    ["<leader>t"] = "<C-W>li",
    ["<leader>rl"] = "<C-w>L",
    ["<leader>rh"] = "<C-w>H",
    ["<leader>rj"] = "<C-w>J",
    ["<leader>rk"] = "<C-w>K",
    ["<leader><space>"] = "^",
    ["<C-S>m"] = ":set formatoptions+=w<CR>gggqG",
    ["<C-S>u"] = ":set formatoptions+=w textwidth=9999<CR>gggqG",
}

for key, cmd in pairs(n_pairs) do
    vim.keymap.set("n", key, cmd, { noremap = true })
end

local i_pairs = {
    [";"] = "<esc>l",
    ["<C-j>"] = ":<Esc>r;a",
    ["<C-o>"] = "<C-x><C-p>",
    ["<C-l>"] = "<C-x><C-k>",
    ["TT"] = "`",
    ["EE"] = "\\|",
    ["AA"] = "~",
    ["ZZ"] = "_",
    ["Dd"] = "-",
    ["FF"] = "=",
    ["DD"] = "+",
    ["QQ"] = "'",
    ["Qq"] = "\"",
    ["Jj"] = "[",
    ["Kk"] = "]",
    ["JJ"] = "{",
    ["KK"] = "}",
    [",f"] = "\\",
}

for key, cmd in pairs(i_pairs) do
    vim.keymap.set("i", key, cmd, { noremap = true })
end

vim.keymap.set("n", "Q", "<nop>", { noremap = true })
vim.keymap.set("v", "<C-U>", "<nop>", { noremap = true })

local c_pairs = {
    ["TT"] = "`",
    ["RR"] = "\\|",
    ["AA"] = "~",
    ["ZZ"] = "_",
    ["Dd"] = "-",
    ["FF"] = "=",
    ["DD"] = "+",
    ["QQ"] = "'",
    ["Qq"] = "\"",
    ["Jj"] = "[",
    ["Kk"] = "]",
    ["JJ"] = "{",
    ["KK"] = "}",
    [",f"] = "\\",
}

for key, cmd in pairs(c_pairs) do
    vim.keymap.set("c", key, cmd, { noremap = true })
end
