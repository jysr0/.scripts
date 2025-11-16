#!/bin/sh

file="dmenu emojis"
[[ -f $XDG_DOCUMENTS_DIR/"$file" ]] || notify-send "'$file' file does not exist!"
emoji=$(cat $XDG_DOCUMENTS_DIR/"$file" | dmenu -i -l 10 -p '󰱨 copy emoji:')
[[ -n "$emoji" ]] || exit 0
echo "$emoji" | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard && notify-send "'$emoji' copied!"
