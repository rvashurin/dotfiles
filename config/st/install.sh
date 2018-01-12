#!/bin/bash

DIR=$1

cd $DIR
git clone https://aur.archlinux.org/st.git
cd st

ln -sf ../config.h config.h
updpkgsums
makepkg -si --noconfirm

cd ..
rm -rf st

