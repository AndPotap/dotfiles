local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "BurntSushi/ripgrep",
  "jpalardy/vim-slime",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  { "AndPotap/tokyonight.nvim", priority = 1000, config = function() vim.cmd.colorscheme("tokyonight") end },
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "ray-x/lsp_signature.nvim",
  "tzachar/fuzzy.nvim",
  "tzachar/cmp-fuzzy-buffer",
  "nvim-lua/plenary.nvim",
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, },
  {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  },
})
