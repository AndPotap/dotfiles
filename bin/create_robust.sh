#!/bin/bash

dirs_to_create=(vim vim/colors .config .config/nvim .config/nvim/syntax .config/nvim/colors)
for dir in "${dirs_to_create[@]}"
do
    if [ ! -d ~/$dir ]
    then
        mkdir ~/$dir
    fi
done

files_to_create=(.vimrc .bashrc .bash_profile .bash_aliases .inputrc .tmux.conf .ideavimrc .config/flake8)
files_to_create+=(vim/colors/gruv.vim .config/nvim/init.vim .config/nvim/maps.vim)
files_to_create+=(.config/nvim/syntax/txt.vim .config/nvim/colors/gruv.vim)
for f in "${files_to_create[@]}"
do
    # -h Returns true if file exists and is a symlink
    path=~/$f
    if [ -h $path ]
    then
        rm $path
        ln -s ~/dotfiles/$f $path
    else
        ln -s ~/dotfiles/$f $path
    fi
done
