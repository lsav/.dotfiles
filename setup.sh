#!/bin/bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlinks
for i in ctags bash_aliases bash_functions vimrc vim gitignore_global git_template tmux.conf;
do
  ln -s $dotfiles_dir/$i $HOME/.$i
done

# import bash functions
cat >> $HOME/.bashrc <<- EOS
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
EOS

# git setup
git config --global user.name "Lise Savard"
git config --global user.email "git@lisesavard.com"
git config --global core.excludesfile ~/.gitignore_global
git config --global init.templatedir ~/.git_template
