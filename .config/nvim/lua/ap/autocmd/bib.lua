local autocmd = vim.api.nvim_create_autocmd

local grp_bib = vim.api.nvim_create_augroup("bibliography", { clear = true })
autocmd("FileType", { pattern = { "bib" },
    callback = require("ap.bib_maps").setup_keymaps,
    group = grp_bib
})
