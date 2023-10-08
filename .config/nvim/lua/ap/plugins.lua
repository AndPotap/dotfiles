return require('packer').startup(function(use)
    use { 'jpalardy/vim-slime', commit = "3c523dd9d12f96703d07fa35e75d1afe45eecd96"  }
    use 'AndPotap/tokyonight.nvim'
    use { 'wbthomason/packer.nvim', commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" }
    use { 'neovim/nvim-lspconfig', commit = "27c59475ae610cc8ccbb81d9d7859e5ffbd4ec8a" }
    use { 'williamboman/nvim-lsp-installer', commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa" }
    use { 'hrsh7th/nvim-cmp', commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435" }
    use { 'hrsh7th/cmp-nvim-lsp', commit = "44b16d11215dce86f253ce0c30949813c0a90765" }
    use { 'hrsh7th/cmp-buffer', commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
    use {'hrsh7th/cmp-path', commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
    use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}, commit = "ada6352bc7e3c32471ab6c08f954001870329de1" }
    use { 'saadparwaiz1/cmp_luasnip', commit = "18095520391186d634a0045dacaa346291096566" }
    use { 'L3MON4D3/LuaSnip', commit = "cdbf6f41381e5ee4810b4b09284b603d8f18365d" }
    use { 'ray-x/lsp_signature.nvim', commit = "bdf3dc7bb03edd25c2173e0e31c2fb122052ed23" }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",
    }
    use {
        'nvim-telescope/telescope.nvim',
        commit = "7d51950854a3f8853c5c0d570757095e9a5af313",
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'BurntSushi/ripgrep', commit = "abfa65c2c1cd2140934ef93c438540557afc4a2c" }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', commit = "6c921ca12321edaa773e324ef64ea301a1d0da62" }
    use { 'nvim-treesitter/nvim-treesitter', commit = "a102053352bd958d84a3e1be3de0203d2af92984" }
    use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
        commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
    })
end)
