# Step-by-step NVIM config

This guide documents the step-by-step introduction of each plugin (or set of plugins) along with their intended use.
Therefore, this procedure goes from the most minimal config to the whole 9 yards.
Also the procedure is documented neatly by going from commit: `93a7ec7`
to commit: `49f2bba` linearly.

## Adding mappings
Starting in `git checkout 93a7ec7d6416fbff05955ab2e91efcbc7917e706`, I introduce `lua/ap/maps.lua`.
This file contains all the vim keybindings and set of configurations that I commonly use (and so I
can navigate freely around vim).
In this commit you can see the interplay of the `require(ap.module)` construction.

## Adding autocmds
Captured in `git checkout c433e6d7ff93dfa6ad936e01857b26a9c4b4189e`, I enable the latex keymaps and
also the autocmds which only run for certain file types. For example, my `def` to `def` keymap in
Python or the whole encrypt and decrypt business when reading `gpg` files.
Also this commit is interesting as it shows how do modularly introduce code through the
`lua/ap/autocmd` module / folder which contains submodules and has its own `init.lua`.

## Adding packer (plugin manager)
In this commit `git checkout 58847a1807c524bdccf4ae0eb29e44fd0d966f4e`, I install packer.
Note that you have to install packer first by cloning (`git clone`) the repo as indicated in their
`README.md`.

## Adding LSP support
I introduce the LSP support in `git checkout bbb77de0bd84e0856a5986be6faa899eb32980cd`.
This support comes directly from the Neovim team and I add it through `packer` as follows 
``` lua
use "neovim/nvim-lspconfig"
```
For this to work, as I'm not using an LSP plugin to help me with the installation I have to run `py
-m pip install "python-lsp-server[all]"` to ensure that `pylsp --help` runs.
That is, that the `pylsp` bin is present.
In the `lua/ap/lsp.lua` file I configure the use of formatter (such as yapf) and also the
keybindings for the LSP (to run functionality like "go to definition" or "rename").

## Adding autocomplete
This is done in `git checkout 45f39bf0fdabec4434d8f2d9ab036338fdc97c50`.
For the autocompletion I have to introduce a myriad of packages to `packer`:
```lua
use "hrsh7th/nvim-cmp"
use "hrsh7th/cmp-nvim-lsp"
use "hrsh7th/cmp-path"
use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
use { "tzachar/cmp-fuzzy-buffer", requires = { "tzachar/fuzzy.nvim" } }
use "saadparwaiz1/cmp_luasnip"
use "L3MON4D3/LuaSnip"
```
and the configs are placed in `lua/ap/cmp.lua` where I define how `<TAB>` allows me to go through
different alternatives and `<CR>` to select them.
Here is the role of each plugin. `hrsh7th/nvim-cmp` is the autocompletion engine written in lua.
Now, `hrsh7th/cmp-nvim-lsp` creates a client for Neovim's LSP and
`hrsh7th/cmp-path` provides file path autocompletions to the engine.
Similarly, `tzachar/cmp-fuzzy-buffer` suggests completions via fzf which requires
the `nvim-telescope/telescope-fzf-native.nvim` install (besides also having `fzf` installed).
Finally, the snippets suggestions come from the engine `L3MON4D3/LuaSnip` which is linked to
`nvim-cmp` via `saadparwaiz1/cmp_luasnip`.

## Adding the colorscheme and status line
Check `git checkout 7d8684527d1e484d803b478d3ccf6a3aa747ce50` for this change.
Really simple, add to `packer`:
```lua
use "AndPotap/tokyonight.nvim"
use "nvim-lualine/lualine.nvim"
```
and introduce the configs in `lua/ap/status.lua`.
Also I introduce the following line to the `init.lua`
```lua
vim.cmd.colorscheme("tokyonight")
```

## Adding treesitter capabilities
I introduce treesitter through `git checkout 3d0f8aca45c2d71d88b93418f40cca4288149f2b`.
In `packer`:
```lua
use "nvim-treesitter/nvim-treesitter"
```
and the configs are saved in `lua/ap/tree.lua`.
To have the Python highlights that I love like the red `breakpoint()` I need to add 
`after/queries/python/highlights.scm`.

## Added function signature retrieval
Really easy on `git checkout f4b846e7383f36321bf33fd3155fdb73e1a35643`
by introducing 
```lua
use "ray-x/lsp_signature.nvim"
```
and a small config in `lua/ap/signature.lua`.

## Adding telescope fuzzy file explorer
Done in `git checkout d954df4a7a2837774f7f0475f7ea7a42271cbea5`.
In `packer`
```lua
use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    requires = { { "nvim-lua/plenary.nvim" } }
  }
use "BurntSushi/ripgrep"
use
```
where I have to install `ripgrep` through that git repo.
The configs are saved in `lua/ap/teles.lua`.
Here I set the keymaps and also which file path patterns to ignore in 
```lua
file_ignore_patterns = { "%.ipynb", "%.yaml", "%.pkl", "%.log", "%.png", "%.pyc", "%.npy", "%.pdf", "%/logs"}
```

## Adding REPL line paster
Done in `git checkout 084c0e71b067e7d76fa4d3939cf70e3fbc6b091f`.
In `packer`
```lua
use "jpalardy/vim-slime"
use
```
and the configs are saved in `lua/ap/slime.lua`.
Here I define the TMUX interaction and the keymaps to use.
```lua
vim.g.slime_target = "tmux"
vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
```

## Adding undotree
Done in `git checkout 60a600ca190c17d7f7b329a212dba519b278bade`.
In `packer`
```lua
use "mbbill/undotree"
```
with the config in `lua/ap/undotree.lua`.

## Adding markdown rendering
Done in `git checkout 6ef0fe0d5f7e50d1dfc8891b5622fc55cb698bd7`.
In `packer`
```lua
use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })
use
```
with no config. I also think this takes a little to run, not because of the `git pull` but rather
because it is always running `npm install` over and over again.

## Closing loose ends
Done in `git checkout 49f2bbadb305b68abdf4211141a4d952ff5974e8`.
