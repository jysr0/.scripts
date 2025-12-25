#!/bin/sh

#     
temp=$(sensors | tr -d '+' | awk '/^Package/ {print $4}')
echo " $temp"
#usage=$(mpstat -u | awk '/all/ {print $4}' | awk -F'.' '{print $1}')
#case $temp in
#	 [0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[1][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[2][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[3][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[4][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[5][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[6][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[7][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[8][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	[9][0-9].[0-9]°[Cc]) echo " $usage%  $temp";;
#	100°[Cc]) echo " $usage%  $temp";;
#esac
