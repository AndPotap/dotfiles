local ns_id = vim.api.nvim_create_namespace('my_highlights')

local patterns = {
    textComment = "\"\\_.\\{-}\"",
    textComment2 = "\\`\\_.\\{-}\\`",
    textUnderline = "<\\_.\\{-}>",
    textAr = "@\\((\\_.\\{-})\\)",
    textCode = "\\$\\[\\_.\\{-}\\]",
    textTitle1 = "%%%%.*$",
    textTitle2 = "##.*$",
    textBullet = "*\\s",
}

for hl_group, pattern in pairs(patterns) do
    local matches = vim.fn.synstack(vim.fn.line('.'), vim.fn.col('.'))
    for _, match in ipairs(matches) do
        local _, srow, scol, _ = vim.fn.getpos(match)
        local _, erow, ecol, _ = vim.fn.getpos(pattern)
        vim.api.nvim_buf_add_highlight(0, ns_id, hl_group, srow - 1, scol - 1, ecol - 1)
    end
end
