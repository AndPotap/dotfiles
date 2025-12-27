require("nvim-treesitter").setup {
    ensure_installed = { "python", "markdown", "vim", "yaml" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "c" },
    highlight = {
        enable = true,
        disable = { "markdown", "vim", "latex", "gpg" },
        additional_vim_regex_highlighting = false,
    },
}

require("nvim-treesitter").setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  }
}
