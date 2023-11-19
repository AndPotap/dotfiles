local autocmd = vim.api.nvim_create_autocmd

local function noremap(k, v)
    vim.keymap.set("n", k, v, { silent = true, noremap = true })
end


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
