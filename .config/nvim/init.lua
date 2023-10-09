require('ap.maps')
require('ap.packer')
require('ap.lsp')
require('ap.cmp')
require('ap.status')
require('ap.signature')
require('ap.tree')
require('ap.teles')
require('ap.slime')

vim.cmd.colorscheme("tokyonight")

vim.api.nvim_exec('source ~/.config/nvim/autogroups.vim', false)

local autocmd = vim.api.nvim_create_autocmd

local function noremap(k, v)
    vim.keymap.set('n', k, v, { silent = true, noremap = true })
end

local grp_python = vim.api.nvim_create_augroup("pythonops", { clear = true })
local function enable_python_keys()
    noremap('<leader>b', 'A<Enter>breakpoint()<Esc>')
    noremap('<leader>ff', '/def<Space><Enter>')
    noremap('<leader>cl', '/class<Space><Enter>')
    noremap('<leader>cc', '^<C-V>I#<Space><Esc>j^')
    noremap('<leader>un', '^xxj^')
end
autocmd("FileType", { pattern = { "python" },
    callback = enable_python_keys,
    group = grp_python
})

local grp_text = vim.api.nvim_create_augroup("textops", { clear = true })
local function enable_text_keys()
    noremap('<leader>0', '%s/\\s\\+$//e')
    noremap('<leader>cl', '/%%%%<cr>')
    noremap('<leader>ff', '/##<cr>')
    noremap('<C-S>', ':set syntax=txt<CR>')
    vim.o.spell = true
end
autocmd("FileType", { pattern = { "text" },
    callback = enable_text_keys,
    group = grp_text
})

local grp_latex = vim.api.nvim_create_augroup("latex", { clear = true })
autocmd("FileType", { pattern = { "plaintex", "tex" },
    callback = require('ap.latex_maps').setup_tex_keymaps,
    group = grp_latex
})
