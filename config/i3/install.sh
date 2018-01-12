#!/bin/zsh

DIR=$(dirname "$(readlink -f "$0")")

set -o dotglob
mkdir -p ~/.config/i3

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/.config/i3/$(basename $link_file | sed s/.link//);
done

set +o dotglob

