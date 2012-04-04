#!/bin/bash


echo "set up dotfiles..."
DOT_FILES=( .vim .vimrc )

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        echo "file already exists: $file"
    else
        ln -s $/HOME/dotfiles/$file $HOME/$file
        echo "created symbolic link: $file"
    fi
done
