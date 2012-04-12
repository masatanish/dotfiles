#!/bin/bash


echo "set up dotfiles..."
DOT_FILES=( .vimrc .zshrc )

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        if [ -L $HOME/$file ]; then
            echo "symbolic link exists: $file"
        else
            echo "WARNING: file already exists: $file"
        fi
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo "created symbolic link: $file"
    fi
done
if [ -a $HOME/.vimrc ]; then
	echo "symbolic link exists: .vim"
else
	ln -s $/HOME/dotfiles/vimfiles $HOME/.vim
	echo "created symbolic link: .vim"
fi
