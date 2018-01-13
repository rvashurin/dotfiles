#!/bin/bash

DIR=$1

chsh -s /bin/zsh

shopt -s dotglob

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob

ls -sf /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme /usr/share/oh-my-zsh/themes/powerlevel9k.zsh-theme 

