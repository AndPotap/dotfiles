local M = {}

M.setup_keymaps = function ()
    vim.fn.setreg("/", "+++")
    vim.fn.setreg("1", "Advances in Neural Information Processing Systems (NeurIPS)")
    vim.fn.setreg("2", "International Conference on Machine Learning (ICML)")
    vim.fn.setreg("3", "International Conference on Learning Representations (ICLR)")
    vim.fn.setreg("4", "International Conference on Artificial Intelligence and Statistics (AISTATS)")
    vim.fn.setreg("5", "Association for the Advancement of Artificial Intelligence (AAAI)")
end

return M
