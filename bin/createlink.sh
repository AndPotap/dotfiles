#!/bin/bash

rm ~/.vimrc
rm ~/.bashrc
rm ~/.bash_profile
rm ~/.bash_aliases
rm ~/.tmux.conf
rm ~/.ideavimrc

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.ideavimrc  ~/.ideavimrc
