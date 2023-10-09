-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pylsp' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

local luasnip = require('luasnip')

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

local cmp = require('cmp')
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
            select = false,
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
        { name = 'nvim_lsp', max_item_count = 10, keyword_length  = 3 },
        { name = 'luasnip', max_item_count = 5, keyword_length  = 2 },
        { name = 'fuzzy_buffer', max_item_count = 10,  keyword_length  = 3, group_index = 2 },
        { name = "path", max_item_count = 5, keyword_length  = 3 },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                fuzzy_buffer = "[FZF]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
}
