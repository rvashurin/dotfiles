#!/bin/bash

DIR=$1
shopt -s dotglob

for link_file in $(ls -a $DIR/*.link); do
  ln -sf $link_file ~/$(basename $link_file | sed s/.link//);
done

shopt -u dotglob

echo "Choose resolution for wallpaper:\n"
echo "1: 1920x1080"
echo "2: 1600x1900"
echo "3: 1366x768"

prepare_wallpaper() {
  read resp 
	case $resp in
    "1")
      cp $DIR/wallpapers/1920_1080.png $DIR/.wallpaper.png
      ;;
    "2")
      cp $DIR/wallpapers/1600_900.png $DIR/.wallpaper.png
      ;;
    "3")
      cp $DIR/wallpapers/1366_768.png $DIR/.wallpaper.png
      ;;
    *)
      echo "Wut? Again!"
      prepare_wallpaper
  esac
}

prepare_wallpaper

ln -sf $DIR/.wallpaper.png ~/.wallpaper.png
