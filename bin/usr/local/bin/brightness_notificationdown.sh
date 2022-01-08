#!/usr/bin/env bash

export XAUTHORITY=/home/aaron/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native /windows/c/Windows/Media/Windows\ Battery\ Low.wav > /dev/null 2>&1

/usr/bin/notify-send -i /usr/share/icons/gnome/256x256/status/battery-full-charging.png 'Dicharging'

xbacklight -set 10
