#!/usr/bin/env bash

export XAUTHORITY=/home/aaron/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

/usr/bin/sudo -u aaron /usr/bin/paplay --server /run/user/1000/pulse/native //windows/c/Windows/Media/tada.wav  > /dev/null 2>&1

/usr/bin/notify-send -i /usr/share/icons/battery-full-charging.jpg 'Charging' --expire-time=4000
xbacklight -set 100
