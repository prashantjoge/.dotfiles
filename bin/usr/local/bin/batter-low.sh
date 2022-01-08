#!/bin/bash

# battery_level=`acpi | grep -oP '(?<=, )\d+(?=%)'`

battery_level=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/ {print substr($2, 1, length($2)-1)}'`

if [ "$battery_level" -le 10 ]
then
  notify-send "Battery low. Battery level is ${battery_level}%!"
elif [ "$battery_level" -le 3 ]
then
  notify-send "Battery critical. Battery level is ${battery_level}%! Suspending..."
  sleep 5
  systemctl suspend
fi
