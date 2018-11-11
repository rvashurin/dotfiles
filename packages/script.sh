#!/bin/bash

echo "Missing native packages:"
echo $(pacman -Qetnq | grep -v -F -f <(cat pacman_pkglist.txt | cut -f1 -d" ") | grep -v -F -f <(pacman -Qgq base base-devel) | grep -v -F -f <(cat blacklisted_packages.txt))

echo ""
echo "Missing foreign packages:"
echo $(pacman -Qetmq | grep -v -F -f <(cat aur_pkglist.txt | cut -f1 -d" ") | grep -v -F -f <(cat blacklisted_packages.txt))

echo ""
echo "Not installed native packages:"
echo $(cat pacman_pkglist.txt | cut -f1 -d" " | grep -v -F -f <(pacman -Qeq))

echo ""
echo "Not installed foreign packages:"
echo $(cat aur_pkglist.txt | cut -f1 -d" " | grep -v -F -f <(pacman -Qeq))
