#!/bin/bash

set -e

DOTDIR=$(pwd -P)

sudo pacman -S --noconfirm git binutils base-devel

git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..

git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ..


git clone https://aur.archlinux.org/st.git
cd st
rm config.h
ln -s $DOTDIR/term/config.h config.h
updpkgsums
makepkg -si --noconfirm
cd ..

rm -rf package-query yaourt st

sudo pacman -S --noconfirm - < "$DOTDIR/packages/pacman_pkglist.txt";
yaourt -S --noconfirm "$DOTDIR/packages/aur_pkglist.txt";
