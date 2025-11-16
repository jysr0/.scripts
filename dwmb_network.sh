#!/bin/sh

wlpstat="$(cat /sys/class/net/[Ww]*/operstate)"
enpstat="$(cat /sys/class/net/[Ee]*/operstate)"
signal="$(nmcli device wifi | awk '/^\*/ {print $8}')"
ssid="$(nmcli -f active,ssid device wifi | grep -i '^yes' | cut -c 4- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"

# 󱈸 󰀂            #ETH
# 󰞃 󰢿 󰢼 󰢽 󰢾       #SIGNAL/ETH
# 󰤯 󰤟 󰤢 󰤥 󰤨 󰤮 󰤭  #WIFI
# 󰤫 󰤠 󰤣 󰤦 󰤩       #ALERT
# 󰤬 󰤡 󰤤 󰤧 󰤪       #LOCKED
# 󱛏 󱛋 󱛌 󱛍 󱛎       #UNLOCKED

if [[ "$enpstat" == "up" ]]; then
	case "$signal" in
		0) echo "󰢿 $ssid";;
		[1-9]) echo "󰢼 $ssid";;
		[1][0-9]) echo "󰢼 $ssid";;
		[2][0-9]) echo "󰢼 $ssid";;
		[3][0-9]) echo "󰢽 $ssid";;
		[4][0-9]) echo "󰢽 $ssid";;
		[5][0-9]) echo "󰢽 $ssid";;
		[6][0-9]) echo "󰢽 $ssid";;
		[7][0-9]) echo "󰢽 $ssid";;
		[8][0-9]) echo "󰢾 $ssid";;
		[9][0-9]) echo "󰢾 $ssid";;
		100) echo "󰢾 $ssid";;
	esac
elif [[ "$wlpstat" == "up" ]]; then
	# 󰤯 󰤟 󰤢 󰤥 󰤨
	case "$signal" in
		0) echo "󰤯 $ssid";;
		[1-9]) echo "󰤟 $ssid";;
		[1][0-9]) echo "󰤟 $ssid";;
		[2][0-9]) echo "󰤢 $ssid";;
		[3][0-9]) echo "󰤢 $ssid";;
		[4][0-9]) echo "󰤢 $ssid";;
		[5][0-9]) echo "󰤥 $ssid";;
		[6][0-9]) echo "󰤥 $ssid";;
		[7][0-9]) echo "󰤥 $ssid";;
		[8][0-9]) echo "󰤨 $ssid";;
		[9][0-9]) echo "󰤨 $ssid";;
		100) echo "󰤨 $ssid";;
	esac
elif [[ "$enpstat" == "dormant" ]]; then
	echo "󱈸󰀂 $ssid"

<<COMMENT
	case "$signal" in
		0) echo "󱈸󰢿";;
		[1-9]) echo "󱈸󰢼";;
		[1][0-9]) echo "󱈸󰢼";;
		[2][0-9]) echo "󱈸󰢼";;
		[3][0-9]) echo "󱈸󰢽";;
		[4][0-9]) echo "󱈸󰢽";;
		[5][0-9]) echo "󱈸󰢽";;
		[6][0-9]) echo "󱈸󰢽";;
		[7][0-9]) echo "󱈸󰢽";;
		[8][0-9]) echo "󱈸󰢾";;
		[9][0-9]) echo "󱈸󰢾";;
		100) echo "󱈸󰢾";;
	esac
COMMENT

elif [[ "$wlpstat" == "dormant" ]]; then
	echo "󱈸 $ssid"

<<COMMENT
	case $signal in
		0) echo "󱈸󰤯";;
		[1-9]) echo "󱈸󰤟";;
		[1][0-9]) echo "󱈸󰤟";;
		[2][0-9]) echo "󱈸󰤢";;
		[3][0-9]) echo "󱈸󰤢";;
		[4][0-9]) echo "󱈸󰤢";;
		[5][0-9]) echo "󱈸󰤥";;
		[6][0-9]) echo "󱈸󰤥";;
		[7][0-9]) echo "󱈸󰤥";;
		[8][0-9]) echo "󱈸󰤨";;
		[9][0-9]) echo "󱈸󰤨";;
		100) echo "󱈸󰤨";;
	esac

	case $signal in
		0) echo "󰤫";;
		[1-9]) echo "󰤠";;
		[1][0-9]) echo "󰤠";;
		[2][0-9]) echo "󰤣";;
		[3][0-9]) echo "󰤣";;
		[4][0-9]) echo "󰤣";;
		[5][0-9]) echo "󰤦";;
		[6][0-9]) echo "󰤦";;
		[7][0-9]) echo "󰤦";;
		[8][0-9]) echo "󰤩";;
		[9][0-9]) echo "󰤩";;
		100) echo "󰤩";;
	esac
COMMENT

elif [[ "$enpstat" == "down" ]] || [[ "$wlpstat" == "down" ]]; then
	echo "󰞃"

# if both enpstat and wlpstat are unknown
else
	echo ""
fi
