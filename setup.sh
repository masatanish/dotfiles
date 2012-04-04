#!/bin/bash


echo "set up dotfiles..."
DOT_FILES=( .vim .vimrc )

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        if [ -L $HOME/$file ]; then
            echo "symbolic link exists: $file"
        else
            echo "WARNING: file already exists: $file"
        fi
    else
        ln -s $/HOME/dotfiles/$file $HOME/$file
        echo "created symbolic link: $file"
    fi
done
