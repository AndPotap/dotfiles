#!/bin/bash

dirs_to_create=(vim vim/colors .config .config/nvim .config/nvim/syntax
               .config/nvim/colors bin .config/alacritty .config/kitty
               .config/zathura)
for dir in "${dirs_to_create[@]}"
do
    if [ ! -d ~/$dir ]
    then
        mkdir ~/$dir
    fi
done

files_to_create=(.vimrc .bashrc .bash_profile .bash_aliases
                 .inputrc .tmux.conf .ideavimrc .config/flake8
                 .config/alacritty/alacritty.yml
                 .dir_colors
                 .config/zathura/zathurarc
                 vim/colors/gruv.vim .config/nvim/init.vim .config/nvim/maps.vim
                 .config/nvim/syntax/txt.vim .config/nvim/colors/gruv.vim
                 .config/kitty/kitty.conf
                 .spectrwm.conf
                 .pylintrc
                 .config/nvim/latex.vim
                 .gnupg/gpg-agent.conf
                 .xmodmap
                 baraction.sh
                 .spectrwm_us.conf)
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
