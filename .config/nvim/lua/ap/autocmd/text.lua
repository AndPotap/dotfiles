local autocmd = vim.api.nvim_create_autocmd

local function noremap(k, v)
    vim.keymap.set("n", k, v, { silent = true, noremap = true })
end

local grp_text = vim.api.nvim_create_augroup("textops", { clear = true })
local function enable_text_keys()
    noremap("<leader>0", "%s/\\s\\+$//e")
    noremap("<leader>cl", "/%%%%<cr>")
    noremap("<leader>ff", "/##<cr>")
    noremap("<C-S>", ":set syntax=txt<CR>")
    vim.cmd("set syntax=txt")
    vim.o.spell = true
end
autocmd("BufEnter", { pattern = { "*txt" },
    callback = enable_text_keys,
    group = grp_text
})
