require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "lua", "latex", "markdown", "vim", "yaml" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "c" },
    highlight = {
        enable = true,
        disable = { "markdown", "vim", "latex" },
        additional_vim_regex_highlighting = false,
    },
}
