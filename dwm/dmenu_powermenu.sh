#!/bin/sh

op1="󰐥 shutdown"
op2="󰜉 restart"
op3="󰤄 sleep"
op4=" hibernate"
op5=" lock"
op6="󰍃 logout"
ansy=" yes"
ansn=" no"

operation=$((echo $op1 ; echo $op2 ; echo $op3 ; echo $op4 ; echo $op5 ; echo $op6) | dmenu -i -p '󰐥 system shutdown:')
if [[ $operation == $op1 ]]; then
	confirmation=$((echo $ansn; echo $ansy) | dmenu -i -p "󱈸 confirm '$operation':")
	[[ $confirmation == $ansy ]] && systemctl poweroff
elif [[ $operation == $op2 ]]; then
	confirmation=$((echo $ansn; echo $ansy) | dmenu -i -p "󱈸 confirm '$operation':")
	[[ $confirmation == $ansy ]] && systemctl reboot
elif [[ $operation == $op3 ]]; then
	systemctl suspend && slock
elif [[ $operation == $op4 ]]; then
	confirmation=$((echo $ansn; echo $ansy) | dmenu -i -p "󱈸 confirm '$operation':")
	[[ $confirmation == $ansy ]] && systemctl hibernate
elif [[ $operation == $op5 ]]; then
	confirmation=$((echo $ansn; echo $ansy) | dmenu -i -p "󱈸 confirm '$operation':")
	[[ $confirmation == $ansy ]] && slock
elif [[ $operation == $op6 ]]; then
	confirmation=$((echo $ansn; echo $ansy) | dmenu -i -p "󱈸 confirm '$operation':")
	[[ $confirmation == $ansy ]] && loginctl -s 15 --no-ask-password terminate-session ${XDG_SESSION_ID}
fi
