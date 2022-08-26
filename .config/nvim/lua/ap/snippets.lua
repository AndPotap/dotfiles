local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local types = require("luasnip.util.types")

ls.setup({
    history = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "choiceNode", "Comment" } },
            },
        },
    },
    ext_base_prio = 300,
    ext_prio_increase = 1,
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    ft_func = function()
        return vim.split(vim.bo.filetype, ".", true)
    end,
})

ls.add_snippets("tex", {
    s({ trig = "par1", dscr = "first parenthesis" },
        {
            t({ "\\bigl( " }),
            i(0),
            t({ " \\bigr)<++>" }),
        }),
    s("par2", {
        t({ "\\Bigl( " }),
        i(0),
        t({ " \\Bigr)<++>" }),
    }),
    s("par3", {
        t({ "\\biggl( " }),
        i(0),
        t({ " \\biggr)<++>" }),
    }),
    s("par4", {
        t({ "\\Biggl( " }),
        i(0),
        t({ " \\Biggr)<++>" }),
    }),
}, {
    key = "tex",
})