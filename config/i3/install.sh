#!/bin/bash

DIR=$1

shopt -s dotglob
mkdir -p ~/.config/i3

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/.config/i3/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob

sudo ln -sf $DIR/i3lock_wallpaper.sh /usr/bin/i3lock_wallpaper

sed "s/<USERNAME>/$(whoami)/" $DIR/suspend.service.skel > $DIR/suspend.service
sudo mv $DIR/suspend.service /etc/systemd/system/
sudo systemctl enable suspend.service

