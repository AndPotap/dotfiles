#!/bin/bash

if [ -f "$HOME/.bashrc" ]; then
	cp "$HOME/.bashrc" "$HOME/.bashrc_bk"
	rm "$HOME/.bashrc"
fi

if [ -f "$HOME/.bash_profile" ]; then
	cp "$HOME/.bash_profile" "$HOME/.bash_profile_bk"
	rm "$HOME/.bash_profile"
fi

if [ -f "$HOME/.profile" ]; then
	cp "$HOME/.profile" "$HOME/.profile_bk"
	rm "$HOME/.profile"
fi

dirs_to_create=(
    .ssh
    bin
    vim
    vim/colors
    .config
    .config/nvim
    .config/nvim/syntax
    .config/nvim/lua
    .config/nvim/lua/ap
    .config/nvim/lua/ap/lsp
    .config/nvim/lua/ap/lsp/settings
    .config/alacritty
    .config/kitty
    .config/zathura
)

for dir in "${dirs_to_create[@]}"
do
    if [ ! -d ~/$dir ]
    then
        mkdir ~/$dir
    fi
done

files_to_create=(
    .ssh/config
    .xmodmap
    .bashrc
    .bash_profile
    .bash_aliases
    .profile
    .inputrc
    .dir_colors
    .tmux.conf
    .vimrc
    vim/colors/gruv.vim
    .config/alacritty/alacritty.yml
    .config/nvim/init.vim
    .config/nvim/maps.vim
    .config/nvim/latex.vim
    .config/nvim/syntax/txt.vim
    .config/nvim/lua/ap/auto.lua
    .config/nvim/lua/ap/cmp.lua
    .config/nvim/lua/ap/color.lua
    .config/nvim/lua/ap/keybindings.lua
    .config/nvim/lua/ap/plugins.lua
    .config/nvim/lua/ap/settings.lua
    .config/nvim/lua/ap/signature.lua
    .config/nvim/lua/ap/status.lua
    .config/nvim/lua/ap/telescope.lua
    .config/nvim/lua/ap/tree.lua
    .config/nvim/lua/ap/lsp/handlers.lua
    .config/nvim/lua/ap/lsp/init.lua
    .config/nvim/lua/ap/lsp/lsp-installer.lua
    .config/nvim/lua/ap/lsp/settings/pyright.lua
    .config/nvim/lua/ap/lsp/settings/sumneko_lua.lua
    .config/flake8
    .config/zathura/zathurarc
    .config/kitty/kitty.conf
    .pylintrc
    .gnupg/gpg-agent.conf
    .spectrwm.conf
    .spectrwm_us.conf
    .ideavimrc
    baraction.sh
)

for f in "${files_to_create[@]}"
do
    path=~/$f
    echo "linked $path"
    # -h Returns true if file exists and is a symlink
    if [ -h $path ]
    then
        rm $path
        ln -s ~/dotfiles/$f $path
    else
        ln -s ~/dotfiles/$f $path
    fi
done

for f in ~/dotfiles/bin/*
do
    if [[ $f != *.sh ]]
    then
        base=$(basename $f)
        path=~/bin/$base
        echo "linked $path"
        if [ -h $path ] || [ -f $path ]
        then
            rm $path
            # cp $f $path
            ln -s $f $path
        else
            # cp $f $path
            ln -s $f $path
        fi
    fi
done
