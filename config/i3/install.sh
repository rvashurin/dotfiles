#!/bin/bash

DIR=$1

shopt -s dotglob
mkdir -p ~/.config/i3

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/.config/i3/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob


