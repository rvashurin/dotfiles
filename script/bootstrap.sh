#!/bin/bash

set -e

install_yaourt() {
  git clone https://aur.archlinux.org/package-query.git
  cd package-query
  makepkg -si
  cd ..
  git clone https://aur.archlinux.org/yaourt.git
  cd yaourt
  makepkg -si
  cd ..
  rm -rf package-query yaourt
}

USERNAME=$1
USERPW=$2
DOTDIR=$(pwd -P)

echo "Please make sure that members of sudo group are able to execute sudo commands without password! Do you wish to proceed with installation?"
if [[ read == "no" ]]; then
  echo "Aborting"
  exit 0
fi

useradd $USERNAME
su $USERNAME -

install_yaourt

sudo pacman -S - < "$DOTDIR/packages/pacman_pkglist.txt"
yaourt -S - < "$DOTDIR/packages/aur_pkglist.txt" 
