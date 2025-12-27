#!/bin/sh


# 󰢿 󰢼 󰢽 󰢾           |-> connected to ETH
# 󱈸󰢿 󱈸󰢼 󱈸󰢽 󱈸󰢾 󱈸󰀂    |-> dormant/alert ETH
# 󰤯 󰤟 󰤢 󰤥 󰤨         |-> connected to WIFI
# 󱈸󰤯 󱈸󰤟 󱈸󰤢 󱈸󰤥 󱈸󰤨 󱈸 |-> dormant/alert WIFI
# 󰞃 /              |-> down / unknown


# 󱈸           
#  󰞃 󰢿 󰢼 󰢽 󰢾 󰀂  #SIGNAL/ETH
# 󰤯 󰤟 󰤢 󰤥 󰤨 󰤮 󰤭  #WIFI
# 󰤫 󰤠 󰤣 󰤦 󰤩       #ALERT
# 󰤬 󰤡 󰤤 󰤧 󰤪       #LOCKED
# 󱛏 󱛋 󱛌 󱛍 󱛎       #UNLOCKED



#[[ -s "/tmp/recent_conn" ]] && cat /dev/null > /tmp/recent_conn # flush its content

wlpstat="$(cat /sys/class/net/[Ww]*/operstate)"
#wlpflags="$(cat /sys/class/net/[Ww]*/flags)"
#wifistat="$(nmcli radio wifi)"

enpstat="$(cat /sys/class/net/[Ee]*/operstate)"
#enpflags="$(cat /sys/class/net/[Ee]*/flags)"

if [[ "$enpstat" == "up" ]]; then
	ssid="$(nmcli -f active,ssid device wifi | grep -i '^yes' | cut -c 4- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"
	#signal="$(($(nmcli -f active,signal device wifi | grep -i '^yes' | cut -c 4- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')))"
	signal="$(($(nmcli -f active,signal device wifi | grep -i '^yes' | cut -c 4- | tr -d '[:space:]')))"
	#bssid="$(nmcli -f active,bssid device wifi | grep -i '^yes' | cut -c 4- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"
	bssid="$(nmcli -f active,bssid device wifi | grep -i '^yes' | cut -c 4- | tr -d '[:space:]')"
	
	[[ -s "/tmp/recent_conn" ]] || echo "$bssid" > /tmp/recent_conn
	echo "󰀂 $signal% $ssid"

elif [[ "$wlpstat" == "up" ]]; then
	# 󰤯 󰤟 󰤢 󰤥 󰤨
	ssid="$(nmcli -f active,ssid device wifi | grep -i '^yes' | cut -c 4- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"
	signal="$(($(nmcli -f active,signal device wifi | grep -i '^yes' | cut -c 4- | tr -d '[:space:]')))"
	bssid="$(nmcli -f active,bssid device wifi | grep -i '^yes' | cut -c 4- | tr -d '[:space:]')"
	
	[[ -s "/tmp/recent_conn" ]] || echo "$bssid" > /tmp/recent_conn
	echo " $signal% $ssid"

elif [[ "$enpstat" == "dormant" ]]; then
	[[ -s "/tmp/recent_conn" ]] || echo "󱈸󰀂"
	signal="$(($(nmcli -f bssid,signal device wifi | grep -i "$(tac /tmp/recent_conn)" | head -n 1 | cut -c 18- | tr -d '[:space:]')))"
	ssid="$(nmcli -f bssid,ssid device wifi | grep -i "$(tac /tmp/recent_conn)" | head -n 1 | cut -c 18- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"

	echo "󱈸󰀂 $ssid"

elif [[ "$wlpstat" == "dormant" ]]; then
	[[ -s "/tmp/recent_conn" ]] || echo "󱈸"
	signal="$(($(nmcli -f bssid,signal device wifi | grep -i "$(tac /tmp/recent_conn)" | head -n 1 | cut -c 18- | tr -d '[:space:]')))"
	ssid="$(nmcli -f bssid,ssid device wifi | grep -i "$(tac /tmp/recent_conn)" | head -n 1 | cut -c 18- | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')"

	echo "󱈸 $ssid"

else
	echo ""
fi
