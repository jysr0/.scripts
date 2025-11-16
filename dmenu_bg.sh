#!/bin/sh

[[ (-d $XDG_PICTURES_DIR) && (-d $XDG_PICTURES_DIR/backgrounds) ]] || exit 1
[[ -d $XDG_CACHE_HOME ]] || exit 1
	bg="$(ls -A $XDG_PICTURES_DIR/backgrounds | dmenu -i -l 10 -p '󰸉 set background:')"
	xwallpaper --stretch $XDG_PICTURES_DIR/backgrounds/$bg && cp $XDG_PICTURES_DIR/backgrounds/$bg $XDG_CACHE_HOME/bg.jpg
