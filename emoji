#!/bin/sh

file="dmenu_emojis"
[[ -f $XDG_DOCUMENTS_DIR/"$file" ]] || (notify-send "'$file' file does not exist!" && exit 1)
emoji=$(cat $XDG_DOCUMENTS_DIR/"$file" | dmenu -i -l 10 -p '󰱨 copy emoji:' | awk '{print $1}' | tr -d '\n')
[[ -n "$emoji" ]] || exit 0
printf "$emoji" | xclip -selection clipboard && notify-send "'$emoji' copied!"
