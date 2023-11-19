# Dotfiles

## Neovim notes
* **Lua is faster and smaller than Python**, that is why it was embedded to Neovim as
  default.
* **Lua is much faster than VimScript**, and so the plugins based on lua deliver
  snappier responses.
* **I don't think moving completely to Lua is necessary**. Neovim still expects to
  leverage the work on thousands of plugins that were written in VimScript.
* **Lua files are ran before VimScript files**.

## Neovim debugging
Got to `.config/nvim/StepByStep.md` to see a guide and documentation over the plugings
and the settings that I use for Neovim. 
Also it should help you to debug as you go from a minimal install to the full thing.

### Some observatons
#### Installing LSP using node and npm.
To install some LSP like `sumneko_lua`. **For this last plugin to work
properly I have to install node and npm**.
```bash
curl -sL install-node.vercel.app/lts | sudo bash -s -- -y
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
