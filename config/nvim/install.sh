#!/bin/bash

DIR=$1

shopt -s dotglob
mkdir -p ~/.config/nvim

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/.config/nvim/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall

