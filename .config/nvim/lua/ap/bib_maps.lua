local M = {}

M.setup_keymaps = function ()
    vim.fn.setreg("/", "+++")
    vim.fn.setreg("n", "Advances in Neural Information Processing Systems (NeurIPS)")
    vim.fn.setreg("i", "International Conference on Machine Learning (ICML)")
end

return M
