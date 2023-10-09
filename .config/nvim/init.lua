require("ap.maps")
require("ap.autocmd")
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

-- Legacy highlights
-- function set_highlight(group, opts)
--     vim.api.nvim_set_hl(vim.api.nvim_get_current_buf(), group, opts)
-- end
--
-- set_highlight('Normal', { ctermbg='none', bg='none' })
-- set_highlight('NonText', { ctermfg='none', ctermbg='none', fg='none', bg='none' })
