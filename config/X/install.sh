#!/bin/zsh

DIR=$(dirname "$(readlink -f "$0")")
set -o dotglob

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/$(basename $link_file | sed s/.link//);
done

set +o dotglob

