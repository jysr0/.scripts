#!/bin/sh

dir="backgrounds"
[[ -d $XDG_PICTURES_DIR/$dir ]] || (notify-send "'$dir' directory doesn't exist" && exit 1)
[[ -d $XDG_CACHE_HOME ]] || (notify-send "create home 'cache' directory and try again" && exit 1)
	bg="$(ls -A $XDG_PICTURES_DIR/$dir | dmenu -i -l 10 -p '󰸉 set background:')"
	xwallpaper --stretch $XDG_PICTURES_DIR/$dir/$bg 2> /dev/null && cp $XDG_PICTURES_DIR/$dir/$bg $XDG_CACHE_HOME/bg.jpg
