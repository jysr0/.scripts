#!/bin/sh

capacity=$(cat /sys/class/power_supply/*BAT*/capacity)
stat=$(cat /sys/class/power_supply/*BAT*/status) # one of: Full, Discharging, Charging, Not charging, Unknown

if [[ $stat == "Charging" ]]; then
	case $capacity in
		 [0-9]) echo "󰢜 $capacity%";;
		[1][0-9]) echo "󰂆 $capacity%";;
		[2][0-9]) echo "󰂆 $capacity%";;
		[3][0-9]) echo "󰂈 $capacity%";;
		[4][0-9]) echo "󰢝 $capacity%";;
		[5][0-9]) echo "󰂉 $capacity%";;
		[6][0-9]) echo "󰢞 $capacity%";;
		[7][0-9]) echo "󰂊 $capacity%";;
		[8][0-9]) echo "󰂋 $capacity%";;
		[9][0-9]) echo "󰂅 $capacity%";;
		100) echo " $capacity%";;
	esac
fi

case $capacity in
	100) echo "󰁹 $capacity%";;
	[9][0-9]) echo "󰁹 $capacity%";;
	[8][0-9]) echo "󰂂 $capacity%";;
	[7][0-9]) echo "󰂁 $capacity%";;
	[6][0-9]) echo "󰂀 $capacity%";;
	[5][0-9]) echo "󰁿 $capacity%";;
	[4][0-9]) echo "󰁾 $capacity%";;
	[3][1-9]) echo "󰁽 $capacity%";;
	30) echo "❗󰁽 $capacity%";;
	[2][0-9]) echo "❗󰁼 $capacity%";;
	[1][0-9]) echo "❗󰁻 $capacity%";;
	 [0-9]) echo "❗󰁺 $capacity%";;
esac
