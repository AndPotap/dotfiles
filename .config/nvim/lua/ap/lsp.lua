local lspconfig = require("lspconfig")

-- vim.lsp.set_log_level("debug")
-- Enable above to see logs from :LspLog

-- lspconfig.ruff.setup{
--     cmd = { "ruff", "server", "--preview" },
--     filetypes = { "python" },
-- }
-- I don't see additonal features from pip install python-lsp-ruff

-- lspconfig.pylsp.setup{}
-- currently PyLSP is being attached from cmp.lua

lspconfig.clangd.setup{
    cmd = { "clangd-12" }
}

lspconfig.rust_analyzer.setup{}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>au", function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
