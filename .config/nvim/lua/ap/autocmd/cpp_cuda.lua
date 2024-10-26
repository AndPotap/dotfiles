local autocmd = vim.api.nvim_create_autocmd
local cuda_grp = vim.api.nvim_create_augroup("cuda", { clear = true })

local function fix_indent()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
end

autocmd("BufEnter", {
  pattern = { "*.cu", "cpp", "c", "h", "cu", "cuh" },
  callback = fix_indent,
  group = cuda_grp
})
