# Dotfiles

## Neovim notes
* **Lua is faster and smaller than Python**, that is why it was embedded to Neovim as
  default.
* **Lua is much faster than VimScript**, and so the plugins based on lua deliver
  snappier responses.
* **I don't think moving completely to Lua is necessary**. Neovim still expects to
  leverage the work on thousands of plugins that were written in VimScript.
* **Lua files are ran before VimScript files**. Not sure how relevant is this note.

## Todos
* Explain the structure of lua folders
* Discuss what is an LSP

### Purpose of each plugin
I ordered the plugins by importance.

The next set of plugins allows me to get autocompletion.
```lua
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'saadparwaiz1/cmp_luasnip'
use 'L3MON4D3/LuaSnip'
```
`hrsh7th/nvim-cmp` is the completion engine written in lua. This mostly handles the
mappings and leverages the snippets suggestion engine `L3MON4D3/LuaSnip` via
`saadparwaiz1/cmp_luasnip`. Then `hrsh7th/cmp-nvim-lsp` creates a **client**a for
Neovim's LSP. To my understanding it somewhat overrides the omnifunc capabilities and
adds some more. Illustrated in this lines:
```lua
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
```
finally, `hrsh7th/cmp-buffer` and `hrsh7th/cmp-path` provide completion suggestions from
the buffer or path respectively.

The next set of plugins allows me to use LSP for linter, formatting and suggestions for
the autocompletion engine.
```lua
use 'neovim/nvim-lspconfig'
use 'williamboman/nvim-lsp-installer'
```
the last one helping me install some LSP like `sumneko_lua`. **For this last plugin to work
properly I have to install node and npm**.
```bash
curl -sL install-node.vercel.app/lts | sudo bash -s -- -y
```

The next set of plugins allow me to use fuzzy search
```lua
use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'BurntSushi/ripgrep'
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
```
the `BurntSushi/ripgrep` helps on the grep type searches and
`nvim-telescope/telescope-fzf-native.nvim` is supposed to make the fuzzy finder work
faster.

This plugin is the installer of all the others.
```lua
use 'wbthomason/packer.nvim'
```

The next plugin allows me to see the signature of the function while I'm typing:
```lua
use 'ray-x/lsp_signature.nvim'
```

The next set of plugins generate the colorscheme and the status line.
```lua
use 'AndPotap/tokyonight.nvim'
use {'nvim-lualine/lualine.nvim',
     requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
```

I don't fully understand the value of the Tree sitter but it is supposed to be a relevant
feature. Also it is asked by the Telescope plugin.
```lua
use 'nvim-treesitter/nvim-treesitter'
```

Vim slime allows me to push a line of text from Neovim to my other TMUX pane (I mostly do
this when debugging).
```lua
use 'jpalardy/vim-slime'
```

Finally, this plugin allows me to render markdown locally!
```lua
use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
```

### Custom syntax and highlighting
This complicated as it involves many moving pieces (`alacritty.yml`, `init.vim`) and concepts that I
don't fully understand (like the terminals: `screen-256colors` vs `xterm-256colors`).

These are the main steps that I followed to make it work:
* **Downloading and configuring the colorscheme**.
* **Synchronizing both terminal and nvim for that colorscheme**.
* **Adding vim settings and commands**.

#### Downloading and configuring the colorscheme
Currently I'm working with `colorscheme tokyonight` (https://github.com/folke/tokyonight.nvim) 
where before I had `colorscheme gruvbox` (https://github.com/morhetz/gruvbox).
The modifications that I do are: (1) define new colors and (2) highlight the new
elements that I have defined in syntax files.

To automate this, I forked the repo and load my modified fork as a plugin. See the
differences by looking at the commit history.

#### Synchronizing both terminal and nvim for that colorscheme
Here I basically have to modify `.config/alacritty/alacritty.yml`. The main modifications
in this yaml file are the introduction of colors palettes. The code example below shows
how to add one case and also how to select it at the end.
```yaml
schemes:
  tokyo-night-storm: &tokyo-night-storm
      primary:
        background: '0x24283b'
        foreground: '0xc0caf5'
      normal:
        black:   '0x1D202F'
        red:     '0xf7768e'
        green:   '0x9ece6a'
        yellow:  '0xe0af68'
        blue:    '0x7aa2f7'
        magenta: '0xbb9af7'
        cyan:    '0x7dcfff'
        white:   '0xa9b1d6'
      bright:
        black:   '0x414868'
        red:     '0xf7768e'
        green:   '0x9ece6a'
        yellow:  '0xe0af68'
        blue:    '0x7aa2f7'
        magenta: '0xbb9af7'
        cyan:    '0x7dcfff'
        white:   '0xc0caf5'
      indexed_colors:
        - { index: 16, color: '0xff9e64' }
        - { index: 17, color: '0xdb4b4b' }
colors: *tokyo-night-storm
```
As of now, **the terminal colors affect the rendering of the Neovim colors**. The way
that I have dealt with this is to set the default foreground in the theme to be `None`
(see commit history in my fork).

#### Adding vim settings and commands
For this to work I have to add my (1) `syntax` into the `runtimepath` and (2) add series
of commands.
For (1), I need to run
```
set runtimepath+=~/.config/nvim/
```
where I have `~/.config/nvim/syntax/txt.vim` that defines the logic to highlight certain
patterns like
```
syn match textAr "@\((\_.\{-})\)"
```
which highlights every element in `@(XXX)`. This `textAr` name is then added to the
`theme.lua` with its specified color.

For (2), I need to add this cryptic command (which I don't fully understand)
```
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
```
the first one is the important one. It helps to synchronize (somewhat) the terminal and
vim.
