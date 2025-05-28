local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
telescope.setup {
    defaults = {
        file_ignore_patterns = { "%.ipynb", "%.svg", "%.csv", "%.pkl", "%.log", "%.png", "%.pyc", "%.npy", "%.pdf", "%.mtx", "%/logs"},
        mappings = {
            i = {
                ["<CR>"] = actions.select_vertical,
                ["<C-d>"] = actions.close,
                ["<C-y>"] = actions.select_tab,
            },
            n = {
                ["<CR>"] = actions.select_vertical,
                ["<C-d>"] = actions.close,
                ["<C-y>"] = actions.select_tab,
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

search_specific_dir = function()
    builtin.find_files({
        prompt_title = "< CoLA >",
        cwd = "~/cola",
        -- attach_mappings = function(_, map)
        --     map("i", "<CR>", actions.select_vertical + actions.center)
        --     map("n", "<CR>", actions.select_vertical + actions.center)
        --     return true
        -- end
    })
end

vim.keymap.set("n", "<leader>fc", search_specific_dir, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>g", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>?", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fr", builtin.registers, {})
