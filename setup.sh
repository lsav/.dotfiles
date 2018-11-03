#!/bin/bash

dotfiles_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# prompt for email
echo "Enter your email (used to set up git): "
read email

# symlinks
echo "Creating symlinks..."
for i in bash_functions vimrc vim gitconfig gitignore_global;
do
  ln -s $dotfiles_dir/$i $HOME/.$i
done

# set up vim
cd $dotfiles_dir/vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall

# MacOS
if [ `uname` == "Darwin" ] ; then
    if test ! $(which brew); then
        echo "Installing brew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew update
        brew upgrade --all
    fi

    echo "Setting up shell..."
    brew install zsh zsh-completions
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    ln -s $dotfiles_dir/zshrc $HOME/.zshrc
    ln -s $dotfiles_dir/bash_functions $HOME/.zshrc

    echo "Installing brew apps..."
    brew install ack
    brew install git
    brew install python
    brew install tree
    brew install wget
    brew cleanup

    echo "Installing cask apps..."
    apps=(
        dropbox
        firefox
        google-chrome
        iterm2
        mactex
        slack
        spotify
        virtualbox
    )
    brew cask install --appdir="/Applications" ${apps[@]}
fi

# linux
if [ `uname` == "Linux" ] ; then
    ln -s $dotfiles_dir/bash_functions $HOME/.$i
    cat >> $HOME/.bashrc <<- EOS
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
EOS
fi

# copy fonts
echo "Copying fonts..."
if [ `uname` == "Darwin" ] ; then
    cp $dotfiles_dir/fonts/* ~/Library/Fonts;
elif [ `uname` == "Linux" ] ; then
    mkdir -p $HOME/.local/share/fonts;
    cp $dotfiles_dir/fonts/* $HOME/.local/share/fonts;
    fc-cache -f -v;
fi

# get ssh key for git
if [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
    echo "Creating ssh key for git..."
    ssh-keygen -t rsa -b 4096 -C "$email"
fi

if [ `uname` == "Darwin" ] ; then
    pbcopy < $HOME/.ssh/id_rsa.pub
elif [ `uname` == "Linux" ] ; then
    sudo apt-get install xclip
    xclip -sel clip < $HOME/.ssh/id_rsa.pub
fi

echo "Your public key has been copied to the clipboard. Go add it to github!"

