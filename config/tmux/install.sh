#!/bin/bash

DIR=$1

shopt -s dotglob

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob

