# Dotfiles

## Notes on vim
* **Lua is faster and smaller than Python**, that is why it was embedded to Neovim as
  default.
* **Lua is much faster than VimScript**, and so the pluggins based on lua deliver
  snappier responses.
* **I don't think moving completely to Lua is necessary**. Neovim still expects to
  leverage the work on thousands of plugins that were written in VimScript.
* **Lua files are ran before VimScript files**. Not sure how relevant is this note.

### Purpose of each plugin

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
