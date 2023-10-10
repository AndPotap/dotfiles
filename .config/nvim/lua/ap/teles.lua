local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
telescope.setup {
    defaults = {
        file_ignore_patterns = { "%.ipynb", "%.yaml", "%.pkl", "%.log", "%.png", "%.pyc", "%.npy", "%.pdf", "%/logs"},
        mappings = {
            i = {
                ["<CR>"] = actions.select_vertical,
            },
            n = {
                ["<CR>"] = actions.select_vertical,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            }
        }
    }
}
telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>g", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>?", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fr", builtin.registers, {})