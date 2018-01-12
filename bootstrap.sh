#!/bin/bash

set -e

DOTDIR=$(pwd -P)

sudo pacman -S --noconfirm reflector
sudo reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist

sudo pacman -S --noconfirm git base-devel

git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..

git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ..

rm -rf package-query yaourt

sudo pacman -S --noconfirm - < "$DOTDIR/packages/pacman_pkglist.txt";
yaourt -S --noconfirm "$DOTDIR/packages/aur_pkglist.txt";

for dir in $(ls -d $DOTDIR/config/*/); do
  source $dir/install.sh $dir
done
