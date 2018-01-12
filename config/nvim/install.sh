#!/bin/zsh

DIR=$(dirname "$(readlink -f "$0")")

set -o dotglob
mkdir -p ~/.config/nvim

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/.config/nvim/$(basename $link_file | sed s/.link//);
done

set +o dotglob

nvim +PlugInstall +qall

