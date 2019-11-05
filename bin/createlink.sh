#!/bin/bash

rm ~/.vimrc
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.bash_aliases
rm ~/.tmux.conf
rm ~/.ideavimrc

rm ~/.config/flake8
rm ~/.config/nvim/init.vim

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ideavimrc  ~/.ideavimrc
ln -s ~/dotfiles/.config/flake8 ~/.config/flake8
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
