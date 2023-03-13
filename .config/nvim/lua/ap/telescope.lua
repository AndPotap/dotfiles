-- Naming this file telescope.lua generates problems
local telescope = require("telescope")
local actions = require("telescope.actions")
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
telescope.load_extension('fzf')
