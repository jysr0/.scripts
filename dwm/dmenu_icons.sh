#!/bin/sh

file="awesome_icons"
[[ -f $XDG_DOCUMENTS_DIR/"$file" ]] || (notify-send "'$file' file does not exist!" && exit 1)
icon=$(cat $XDG_DOCUMENTS_DIR/"$file" | dmenu -i -l 10 -p ' copy icon:')
[[ -n "$icon" ]] || exit 0
echo "$icon" | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard && notify-send "'$icon' copied!"
