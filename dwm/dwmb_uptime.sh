#!/bin/sh

# 🛸

if [[ $(uptime | awk '{print $3}') != *\:* ]]; then
	echo "󰅕 $(uptime | awk '{print $3}')Min"
else
	echo "󰅕 $(uptime | awk '{print $3}' | tr -d ',' | awk -F':' '{print $1"H:", $2"Min"}' | tr -d ' ')"
fi
