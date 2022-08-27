local luasnip = require 'luasnip'
-- require("luasnip.loaders.from_snipmate").load({ path = { "./snippets" } })
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })

local kind_icons = {
    Text = "T",
    Method = "M",
    Function = "F",
    Constructor = "C",
    Field = "F",
    Variable = "V",
    Class = "C",
    Interface = "I",
    Module = "M",
    Property = "P",
    Unit = "U",
    Value = "V",
    Enum = "E",
    Keyword = "K",
    Snippet = "S",
    Color = "C",
    File = "F",
    Reference = "R",
    Folder = "F",
    EnumMember = "E",
    Constant = "C",
    Struct = "S",
    Event = "E",
    Operator = "O",
    TypeParameter = "T",
}


local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'luasnip', max_item_count = 5},
        { name = 'fuzzy_buffer', max_item_count = 10 },
        -- { name = 'buffer', max_item_count = 10 },
        { name = "path", max_item_count = 5 },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
}
