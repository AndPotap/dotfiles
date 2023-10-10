return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "tzachar/cmp-fuzzy-buffer", requires = { "tzachar/fuzzy.nvim" } }
  use "saadparwaiz1/cmp_luasnip"
  use "L3MON4D3/LuaSnip"
  use "AndPotap/tokyonight.nvim"
  use "nvim-lualine/lualine.nvim"
  use "ray-x/lsp_signature.nvim"
  use "nvim-treesitter/nvim-treesitter"
  use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
  use "BurntSushi/ripgrep"
  use "jpalardy/vim-slime"
end)
