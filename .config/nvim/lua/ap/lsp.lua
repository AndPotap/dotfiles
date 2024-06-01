local lspconfig = require("lspconfig")

-- Unfortunately, the code below is completely non-functional to modify
-- the behaviour of pylsp. However, modifying the configs of the pylsp elements
-- yapf, flake8, autopep8, works.
lspconfig.pylsp.setup{
    settings = {
        formatCommand = { "yapf" },
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false,
                    ignore = { "E301" },
                    maxLineLength = 100
                },
                yapf = {
                    enabled = false
                },
                autopep8 = {
                    enabled = false
                }
            }
        }
    }
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>au", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
