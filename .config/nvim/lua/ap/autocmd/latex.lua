local autocmd = vim.api.nvim_create_autocmd

local function noremap(k, v)
    vim.keymap.set("n", k, v, { silent = true, noremap = true })
end

local grp_latex = vim.api.nvim_create_augroup("latex", { clear = true })
autocmd("FileType", { pattern = { "plaintex", "tex" },
    callback = require("ap.latex_maps").setup_tex_keymaps,
    group = grp_latex
})
