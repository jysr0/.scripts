#!/bin/sh

for bat in /sys/class/power_supply/*BAT* ; do
	#[[ -n "${capacity+x}" ]] && echo "|" # prints | separator if battery is not the first.
	[[ -n "$capacity" ]] && echo "|" # prints | separator if battery is not the first.
	capacity="$(cat $bat/capacity)"
	stat="$(cat $bat/status)" # one of: Full, Discharging, Charging, Not charging, Unknown
	case $stat in 
			"Full") echo " $capacity%";;
			"Discharging") case $capacity in
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
						   esac;;
			"Charging") case $capacity in
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
						esac;;
			"Not charging") echo '🔌';;
			"Unknown");;
	esac
done
