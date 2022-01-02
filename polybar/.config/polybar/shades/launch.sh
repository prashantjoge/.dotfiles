#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/shades"
CONKYD="$HOME/.config/conky"
#kill all scripts (arch_updates)
kill -9 -$(ps -o pgid -p $(cat ~/.config/polybar/shades/scripts/arch/arch_updates.pid) | tail -n1 | sed 's/^[ \t]*//;s/[ \t]*$//')
kill -9 $(cat ~/.config/polybar/shades/scripts/arch/polybar_updates.pid)
# Terminate already running bar instances
killall -q polybar
killall -q conky
~/.config/polybar/shades/scripts/pywal.sh ~/wallpapers/colorful
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

while pgrep -u $UID -x conky >/dev/null; do sleep 1; done
# Launch the bar
polybar -q main -c "$DIR"/config.ini &
conky -q -d -c "$CONKYD"/conky &
conky -q -d -c "$CONKYD"/Gotham &

# Launch arch_updates script
~/.config/polybar/shades/scripts/arch-updates.sh & echo $! > ~/.config/polybar/shades/scripts/arch/arch_updates.pid
