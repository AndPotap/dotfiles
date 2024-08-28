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
    vim.cmd("set syntax=txt")
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
