require("ap.maps")
require("ap.packer")
require("ap.lsp")
require("ap.cmp")
require("ap.status")
require("ap.signature")
require("ap.tree")
require("ap.teles")
require("ap.slime")

vim.cmd.colorscheme("tokyonight")

-- vim.api.nvim_exec('source ~/.config/nvim/autogroups.vim', false)

local autocmd = vim.api.nvim_create_autocmd

local function noremap(k, v)
    vim.keymap.set("n", k, v, { silent = true, noremap = true })
end

local grp_gpg = vim.api.nvim_create_augroup("gpgOps", { clear = true })
local function enable_gpg_keys()
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.textwidth = 0
    vim.opt.wrapmargin = 0
end
autocmd("FileType", { pattern = { "*.gpg" },
    callback = enable_gpg_keys,
    group = grp_gpg
})

local function prep_gpg()
    vim.opt.swapfile = false
    vim.opt.undofile = false
    vim.opt.backup = false
    vim.opt.writebackup = false
    noremap("<leader>w", "mxHmw:w<Enter><Enter>'wzt`x")
    noremap("<leader>ff", "mJ/##<CR>`J")
    noremap("<leader>cl", "mJ/%%%%<CR>`J")
    noremap("<C-S>", ":set syntax=txt<CR>")
    vim.o.spell = true
    vim.g.bin = true
end
autocmd({ "BufReadPre", "FileReadPre"}, { pattern = { "*.gpg" },
    callback = prep_gpg,
    group = grp_gpg
})

local function decrypt()
    local bufnr = vim.api.nvim_get_current_buf()
    local start_line = vim.api.nvim_buf_get_mark(bufnr, '[')[1] - 1
    local end_line = vim.api.nvim_buf_get_mark(bufnr, ']')[1] - 1
    local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)
    local input_data = table.concat(lines, "\n")
    local output_data = vim.fn.system("gpg --decrypt 2> /dev/null", input_data)
    local output_lines = vim.split(output_data, "\n", true)
    vim.api.nvim_buf_set_lines(bufnr, start_line, end_line + 1, false, output_lines)

    vim.g.bin = false
end
autocmd({ "BufReadPost", "FileReadPost"}, { pattern = { "*.gpg" },
    callback = decrypt,
    group = grp_gpg
})

local function encrypt()
    local bufnr = vim.api.nvim_get_current_buf()
    local start_line = vim.api.nvim_buf_get_mark(bufnr, '[')[1] - 1
    local end_line = vim.api.nvim_buf_get_mark(bufnr, ']')[1] - 1
    local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line + 1, false)
    local input_data = table.concat(lines, "\n")
    local output_data = vim.fn.system("gpg --default-recipient-self -ae 2> /dev/null", input_data)
    local output_lines = vim.split(output_data, "\n", true)
    vim.api.nvim_buf_set_lines(bufnr, start_line, end_line + 1, false, output_lines)
end
autocmd({ "BufWritePre", "FileWritePre"}, { pattern = { "*.gpg" },
    callback = encrypt,
    group = grp_gpg
})

autocmd({ "BufWritePost", "FileWritePost"}, { pattern = { "*.gpg" },
    callback = function () vim.api.nvim_command("undo") end,
    group = grp_gpg
})

local grp_python = vim.api.nvim_create_augroup("pythonops", { clear = true })
local function enable_python_keys()
    noremap("<leader>b", "A<Enter>breakpoint()<Esc>")
    noremap("<leader>ff", "/def<Space><Enter>")
    noremap("<leader>cl", "/class<Space><Enter>")
    noremap("<leader>cc", "^<C-V>I#<Space><Esc>j^")
    noremap("<leader>un", "^xxj^")
end
autocmd("FileType", { pattern = { "python" },
    callback = enable_python_keys,
    group = grp_python
})

local grp_text = vim.api.nvim_create_augroup("textops", { clear = true })
local function enable_text_keys()
    noremap("<leader>0", "%s/\\s\\+$//e")
    noremap("<leader>cl", "/%%%%<cr>")
    noremap("<leader>ff", "/##<cr>")
    noremap("<C-S>", ":set syntax=txt<CR>")
    vim.o.spell = true
end
autocmd("FileType", { pattern = { "text" },
    callback = enable_text_keys,
    group = grp_text
})

local grp_latex = vim.api.nvim_create_augroup("latex", { clear = true })
autocmd("FileType", { pattern = { "plaintex", "tex" },
    callback = require("ap.latex_maps").setup_tex_keymaps,
    group = grp_latex
})
