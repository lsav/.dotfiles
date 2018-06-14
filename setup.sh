#!/bin/bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlinks
for i in vimrc vim bash_aliases gitignore_global tmux.conf;
do
  ln -s $dotfiles_dir/$i $HOME/.$i
done

# git setup
git config --global user.name "Lise Savard"
git config --global user.email "git@lisesavard.com"
git config --global core.excludesfile ~/.gitignore_global
