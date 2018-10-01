#!/bin/bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlinks
for i in ctags bash_functions vimrc vim gitconfig gitignore_global git_template;
do
  ln -s $dotfiles_dir/$i $HOME/.$i
done

# import bash functions
if [ `uname` == "Darwin" ] then
    bash_config=".bash_profile"
elif [ `uname` == "Linux" ] then
    bash_config=".bashrc"
fi

cat >> $HOME/$bash_config <<- EOS
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
EOS

# copy fonts
if [ "$(uname)" == "Darwin" ]; then
    cp $dotfiles_dir/* ~/Library/Fonts
elif [ "$(uname)" == "Linux" ]; then
    mkdir -p $HOME/.local/share/fonts
    cp $dotfiles_dir/* $HOME/.local/share/fonts
    fc-cache -f -v
fi
