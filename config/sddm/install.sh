#!/bin/bash

DIR=$1

sudo ln -sf $DIR/sddm.conf.link /etc/sddm.conf
cd /usr/share/sddm/themes
sudo rm -rf abstractdark-sddm-theme
sudo git clone https://github.com/3ximus/abstractdark-sddm-theme.git
sudo cp $DIR/../X/.wallpaper.png /usr/share/sddm/themes/abstractdark-sddm-theme/background.png
sudo systemctl enable sddm.service
