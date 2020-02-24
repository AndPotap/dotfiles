#!/bin/bash

mkdir ~/vim
mkdir ~/vim/colors
mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/nvim/syntax
mkdir ~/.config/nvim/colors

rm ~/.vimrc
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.bash_aliases
rm ~/.inputrc
rm ~/.tmux.conf
rm ~/.ideavimrc

rm ~/.config/flake8
rm ~/.config/nvim/init.vim
rm ~/.config/nvim/maps.vim
rm ~/.config/nvim/syntax/txt.vim
rm ~/.config/nvim/colors/gruv.vim
rm ~/vim/colors/gruv.vim

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ideavimrc  ~/.ideavimrc
ln -s ~/dotfiles/.config/flake8 ~/.config/flake8
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/.config/nvim/maps.vim ~/.config/nvim/maps.vim
ln -s ~/dotfiles/.config/nvim/syntax/txt.vim ~/.config/nvim/syntax/txt.vim
ln -s ~/dotfiles/.config/nvim/colors/gruv.vim ~/.config/nvim/colors/gruv.vim
ln -s ~/dotfiles/vim/colors/gruv.vim ~/vim/colors/gruv.vim
