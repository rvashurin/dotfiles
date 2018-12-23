#!/bin/bash

DIR=$1

shopt -s dotglob

for link_file in $(ls -a $DIR/*.link); do
  filename = $(basename $link_file | sed s/.link//)
  sudo ln -sf $link_file /etc/openvpn/client/$(filename);
  service_name = $(echo "$filename" | sed s/.conf//)
  sudo systemctl enable "openvpn@$service_name"
done

shopt -u dotglob

