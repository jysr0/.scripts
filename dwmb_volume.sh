#!/bin/sh

# 󰕿 󰖀 󰕾 󰸈 󰖁 󰝟 󰝞 󰝝 󱄠 󱄡 #SINK
# 󰍬 󰍮 󰢳 󰢴 󰍭 󱦉 󱦊 󰍯 󰍰 󰍱 #SOURCE

mute="$(pamixer --get-mute)"
vol="$(pamixer --get-volume)"
volhuman="$(pamixer --get-volume-human)"

if [[ $mute == "true" ]]; then
	echo "󰝟"
fi

case $vol in
	0) echo "󰕿 $volhuman";;
	[1-9]) echo "󰖀 $volhuman";;
	[1-3][0-9]) echo "󰖀 $volhuman";;
	[4-9][0-9]) echo "󰕾 $volhuman";;
	100) echo "󰕾 $volhuman";;
esac
