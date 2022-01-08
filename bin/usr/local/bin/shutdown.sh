#!/usr/bin/bash

BATTERY_CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
#BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATTERY_STATUS=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ {print $2}') 
SHUTDOWN_WITH=30

NOTIFY_TITLE="Battery Low"
NOTIFY_ICON=battery_empty
NOTIFY_MESSAGE="Shutting Down in 1 minute."

WM=gnome-shell
WMPID=1000
WMUSER="aaron"

if [[ $BATTERY_CAPACITY -le $SHUTDOWN_WITH && $BATTERY_STATUS = "discharging" ]]; then
# /usr/bin/notify-send -i /usr/share/icons/gnome/256x256/status/battery-low.png 'Discharging' 'Out of Juice. Shutting down in 1 minute.'
dunstify -h string:x-dunst-stack-tag:shutdown -u critical -i /usr/share/icons/gnome/256x256/status/battery-low.png Discharging 'Low battery. Shutting down in 1 minute' 

/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native /usr/lib/libreoffice/share/gallery/sounds/space.wav > /dev/null 2>&1
/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native /usr/lib/libreoffice/share/gallery/sounds/space2.wav > /dev/null 2>&1
/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native /usr/lib/libreoffice/share/gallery/sounds/space3.wav > /dev/null 2>&1
#	sleep 60s
	for ((i=0;i<60;i++)) do dunstify -r 123 -u critical 'Shutdown Imminent in' $i  ; sleep 1; done
	BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
	if [[ $BATTERY_STATUS = "Discharging" && $BATTERY_CAPACITY -le $SHUTDOWN_WITH ]]; then

#/usr/bin/notify-send -i /usr/share/icons/gnome/256x256/status/battery-low.png 'Discharging' 'Out of Juice. Shutting down now!!!!......'
dunstify -h string:x-dunst-stack-tag:shutdown -i /usr/share/icons/gnome/256x256/status/battery-low.png -u critical 'Discharging. SHUTTING DOWN NOW!!!'

/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native /home/aaron/.i3/sounds/click1.wav > /dev/null 2>&1
		sudo systemctl hibernate
	fi
fi
