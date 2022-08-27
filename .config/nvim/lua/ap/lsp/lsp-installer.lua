local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("ap.lsp.handlers").on_attach,
        capabilities = require("ap.lsp.handlers").capabilities,
    }

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("ap.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server.name == "pyright" then
        local pyright_opts = require("ap.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server.name == "pylsp" then
        local pyright_opts = require("ap.lsp.settings.pylsp")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    server:setup(opts)
end)
