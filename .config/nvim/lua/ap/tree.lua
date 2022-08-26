require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "lua", "latex" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "c" },
    highlight = {
        enable = true,
        disable = { "c" },
        additional_vim_regex_highlighting = false,
    },
}
