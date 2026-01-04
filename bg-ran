#!/bin/sh

directory="$XDG_PICTURES_DIR/backgrounds/*"
random_pic=$(shuf -e -n1 $directory)
xwallpaper --stretch $random_pic 2> /dev/null && notify-send -u low 'Wallpaper randomly set!' && cp $random_pic $XDG_CACHE_HOME/bg.jpg
