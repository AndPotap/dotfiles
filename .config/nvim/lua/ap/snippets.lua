local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local types = require("luasnip.util.types")

require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "./snippets" } })

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
            i(1),
            t({ " \\bigr)<++>" }),
        }),
    s({ trig = "par2", dscr = "second parenthesis" },
        {
            t({ "\\Bigl( " }),
            i(0),
            t({ " \\Bigr)<++>" }),
        }),
    s({ trig = "par3", dscr = "third parenthesis" },
        {
            t({ "\\biggl( " }),
            i(0),
            t({ " \\biggr)<++>" }),
        }),
    s({ trig = "par4", dscr = "fourth parenthesis" },
        {
            t({ "\\Biggl( " }),
            i(0),
            t({ " \\Biggr)<++>" }),
        }),
    s({ trig = "pma", dscr = "() matrix" },
        {
            t({ "\\begin{pmatrix}", "    " }),
            i(1),
            t({ "", "\\end{pmatrix}" }),
        }),
    s({ trig = "bma", dscr = "[] matrix" },
        {
            t({ "\\begin{bmatrix}", "    " }),
            i(1),
            t({ "", "\\end{bmatrix}" }),
        }),
}, {
    key = "tex",
})

ls.add_snippets("bib", {
    s({ trig = "article", dscr = "bib template" },
        {
            t({ "@article{" }),
            i(1),
            t({ ",", "    title={{" }),
            i(2),
            t({ "}},", "    author={" }),
            i(3),
            t({ "},", "    journal={Preprint arXiv " }),
            i(4),
            t({ "},", "    year={20" }),
            i(5),
            t({ "},", "}" }),
        }),
}, {
    key = "bib",
})

ls.add_snippets("tex", {
    s({ trig = ",1,", dscr = "Test" },
        {
            t({ "\\frac{" }),
            i(1),
            t({ "}{" }),
            i(2),
            t({ "}" }),
            i(0),
        }),
    s({ trig = "..", dscr = "Dotted" },
        {
            t({ "\\dots" }),
        }),
}, {
    type = "autosnippets",
})

-- , "    " creates a new line and adds 4 spaces (conforming with my latex indentation)
ls.add_snippets("tex", {
    s({ trig = "brackets", dscr = "Cases" },
        {
            t({ "\\left\\{\\begin{array}{lr}" , "    " }),
            i(1),
            t({ ", \\quad "}),
            i(2),
            t({ " \\\\" , "    "}),
            i(3),
            t({ ", \\quad "}),
            i(4),
            t({ " \\\\" , "    "}),
            t({ "\\end{array} \\right." }),
        }),
}, {
    key = "tex",
})

ls.add_snippets("tex", {
    s({ trig = "thm", dscr = "theorem" },
        {
            t({ "\\begin{thm}[" }),
            i(1),
            t({ "]" }),
            t({ "", "  <++>" }),
            t({ "", "\\end{thm}" }),
        }),
    s({ trig = "defi", dscr = "definition" },
        {
            t({ "\\begin{defi}[" }),
            i(1),
            t({ "]" }),
            t({ "", "  <++>" }),
            t({ "", "\\end{defi}" }),
        }),
    }, {
        key = "tex",
    }
)
