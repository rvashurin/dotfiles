#!/bin/bash

DIR=$1

sudo pacman -S --noconfirm iw

INAME=$(iw dev | grep Interface | cut -d' ' -f2)
sudo systemctl enable netctl-auto@$INAME.service

sudo pacman -Rns --noconfirm iw
