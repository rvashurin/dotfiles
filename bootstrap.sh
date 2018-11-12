#!/bin/bash

set -e

DOTDIR=$(pwd -P)

sudo pacman -Syy

sudo pacman -S --noconfirm base-devel reflector
sudo reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -S --noconfirm $(cat $DOTDIR/packages/pacman_pkglist.txt | cut -f1 -d' ')
yay -S $(cat $DOTDIR/packages/aur_pkglist.txt | cut -f1 -d' ')

for dir in $(ls -d $DOTDIR/config/*/); do
  source $dir/install.sh $dir
done

sudo mkdir -p /etc/pacman.d/hooks/
sudo ln -s $DOTDIR/packages/sync_pkgdb.hook /etc/pacman.d/hooks/sync_pkgdb.hook
sudo chmod ag+x $DOTDIR/packages/sync_pkgdb.sh
sudo ln -s $DOTDIR/packages/sync_pkgdb.sh /usr/local/bin/sync_pkgdb.sh
