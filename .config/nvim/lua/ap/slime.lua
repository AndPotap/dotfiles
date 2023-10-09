vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
vim.g.slime_dont_ask_default = true
vim.g.slime_python_ipython = true
vim.api.nvim_set_keymap('n', '<C-i>', '<Plug>SlimeLineSend', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<Plug>SlimeParagraphSend', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<C-i>', '<Plug>SlimeRegionSend', { noremap = true, silent = true })
