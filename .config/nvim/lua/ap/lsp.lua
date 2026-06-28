vim.lsp.config("clangd", { cmd = { "clangd-12" } })
vim.lsp.config("rust_analyzer", {})
vim.lsp.config("mojo", { cmd = { "mojo-lsp-server" }, filetypes = { "mojo" } })

local function format_fn()
  if vim.bo.filetype ~= "mojo" then
    vim.lsp.buf.format({ async = true })
    return
  end

  vim.fn.system({ "mojo", "format", vim.fn.expand("%") })
  vim.cmd("silent e!")
end

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
    -- vim.keymap.set("n", "<space>au", function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set("n", "<space>au", format_fn, opts)
  end,
})
