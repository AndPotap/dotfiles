local g = vim.g
local o = vim.o

g.background = 'dark'
vim.cmd [[syntax on]]
vim.cmd([[colorscheme gruvbox]])

-- g.rainbow_active = true

-- vim.cmd[[syntax on]]
-- g.background = 'dark'
-- vim.cmd([[colorscheme base16-tokyo-night-terminal-storm]])

g.mapleader = ' '
g.maplocalleader = ' '
vim.opt.completeopt = { "menuone", "noselect" }
o.tabstop = 4
o.softtabstop = -1
o.shiftwidth = 0
o.expandtab = true
o.wildignorecase = true
-- vim.opt.colorcolumn = 50
o.scrolloff = 7
o.ignorecase = true
o.nohsearch = true
o.noerrorbells = true
o.nowrap = true
o.clipboard = 'unnamedplus'
o.wildmode = 'longest,list'

o.nobackup = true
o.noswapfile = true
o.nowritebackup = true
o.undofule = true

o.number = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true

o.cursorline = true
o.signcolumn = 'yes:2'
