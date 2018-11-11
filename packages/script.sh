#!/bin/bash

BASE_DIR="/home/mhi/workspace/dotfiles/packages"
MISSING_NATIVE=$(pacman -Qetnq | grep -v -F -f <(cat $BASE_DIR/pacman_pkglist.txt | cut -f1 -d" ") | grep -v -F -f <(pacman -Qgq base base-devel) | grep -v -F -f <(cat $BASE_DIR/blacklisted_packages.txt))
MISSING_FOREIGN=$(pacman -Qetmq | grep -v -F -f <(cat $BASE_DIR/aur_pkglist.txt | cut -f1 -d" ") | grep -v -F -f <(cat $BASE_DIR/blacklisted_packages.txt))

echo "Missing native packages, adding to db:"
echo $MISSING_NATIVE
echo ""
echo "Missing foreign packages, adding to db:"
echo $MISSING_FOREIGN

echo ""
echo "Syncing packages db..."
echo $MISSING_NATIVE > $BASE_DIR/pacman_pkglist.txt
echo $MISSING_FOREIGN > $BASE_DIR/aur_pkglist.txt
sort -u -o $BASE_DIR/pacman_pkglist.txt $BASE_DIR/pacman_pkglist.txt
sort -u -o $BASE_DIR/aur_pkglist.txt $BASE_DIR/aur_pkglist.txt
echo "OK"

echo ""
echo "Not installed native packages:"
echo $(cat $BASE_DIR/pacman_pkglist.txt | cut -f1 -d" " | grep -v -F -f <(pacman -Qeq))

echo ""
echo "Not installed foreign packages:"
echo $(cat $BASE_DIR/aur_pkglist.txt | cut -f1 -d" " | grep -v -F -f <(pacman -Qeq))
