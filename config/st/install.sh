#!/bin/bash

DIR=$1

git clone https://aur.archlinux.org/st.git
cd $DIR/st
ln -sf ../config.h config.h
updpkgsums
makepkg -si --noconfirm
cd ..

rm -rf st

