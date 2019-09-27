#!/bin/bash

DIR=$1

shopt -s dotglob
mkdir -p ~/.config/dunst

for link_file in $(ls -a $DIR/*.link); do
  filename = $(basename $link_file | sed s/.link//)
  ln -sf $link_file ~/.config/dunst/$filename;
  chmod +x ~/.config/dunst/$filename;
done

shopt -u dotglob

