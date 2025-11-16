#!/bin/sh

brightness="$(($(cat /sys/class/backlight/intel_backlight/brightness) * 100 / $(cat /sys/class/backlight/intel_backlight/max_brightness)))"

case $brightness in
	 [0-9]) echo " $brightness%";;
	[1][0-9]) echo " $brightness%";;
	[2][0-9]) echo " $brightness%";;
	[3][0-9]) echo " $brightness%";;
	[4][0-9]) echo " $brightness%";;
	[5][0-9]) echo " $brightness%";;
	[6][0-9]) echo " $brightness%";;
	[7][0-9]) echo " $brightness%";;
	[8][0-9]) echo " $brightness%";;
	[9][0-9]) echo " $brightness%";;
	100) echo " $brightness%";;
esac
