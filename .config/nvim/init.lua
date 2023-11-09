require("ap.maps")
require("ap.autocmd")
require("ap.packer")
require("ap.lsp")
require("ap.cmp")
require("ap.status")
require("ap.tree")
require("ap.signature")
require("ap.teles")
require("ap.slime")
require("ap.undotree")

vim.cmd.colorscheme("tokyonight")

-- vim.api.nvim_exec('source ~/.config/nvim/autogroups.vim', false)

-- Legacy highlights
-- function set_highlight(group, opts)
--     vim.api.nvim_set_hl(vim.api.nvim_get_current_buf(), group, opts)
-- end
--
-- set_highlight('Normal', { ctermbg='none', bg='none' })
-- set_highlight('NonText', { ctermfg='none', ctermbg='none', fg='none', bg='none' })

-- local ns_id = vim.api.nvim_create_namespace('my_highlights')
-- 
-- local patterns = {
--     textComment = "\"\\_.\\{-}\"",
--     textComment2 = "\\`\\_.\\{-}\\`",
--     textUnderline = "<\\_.\\{-}>",
--     textAr = "@\\((\\_.\\{-})\\)",
--     textCode = "\\$\\[\\_.\\{-}\\]",
--     textTitle1 = "%%%%.*$",
--     textTitle2 = "##.*$",
--     textBullet = "*\\s",
-- }
-- 
-- for hl_group, pattern in pairs(patterns) do
--     local matches = vim.fn.synstack(vim.fn.line('.'), vim.fn.col('.'))
--     for _, match in ipairs(matches) do
--         local _, srow, scol, _ = vim.fn.getpos(match)
--         local _, erow, ecol, _ = vim.fn.getpos(pattern)
--         vim.api.nvim_buf_add_highlight(0, ns_id, hl_group, srow - 1, scol - 1, ecol - 1)
--     end
-- end
