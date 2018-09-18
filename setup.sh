#!/bin/bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlinks
for i in ctags bash_aliases bash_functions vimrc vim gitignore_global git_template tmux.conf;
do
  ln -s $dotfiles_dir/$i $HOME/.$i
done

# import bash functions
if [ "$(uname)" == "Darwin" ] then
    bash_config=".bash_profile"
elif [ "$(uname)" == "Linux" ] then
    bash_config=".bashrc"
fi

cat >> $HOME/$bash_config <<- EOS
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
EOS

# git setup
git config --global user.name "Lise Savard"
git config --global user.email "git@lisesavard.com"
git config --global core.excludesfile ~/.gitignore_global
git config --global init.templatedir ~/.git_template

# copy fonts
if [ "$(uname)" == "Darwin" ]; then
    cp $dotfiles_dir/* ~/Library/Fonts
elif [ "$(uname)" == "Linux" ]; then
    mkdir -p $HOME/.local/share/fonts
    cp $dotfiles_dir/* $HOME/.local/share/fonts
    fc-cache -f -v
fi
