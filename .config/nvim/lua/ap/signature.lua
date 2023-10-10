local lsp_signature = require("lsp_signature")

local signature_config = {
    log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
    debug = false,
    zindex = 200,
    hint_enable = false,
    handler_opts = { border = "single" },
    max_width = 80,
}

lsp_signature.setup(signature_config)
