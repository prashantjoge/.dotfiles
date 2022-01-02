#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/shades/colors.ini"
RFILE="$HOME/.config/polybar/shades/scripts/rofi/colors.rasi"
LCONKY="$HOME/.config/conky/Gotham"
RCONKY="$HOME/.config/conky/conky"
# Get colors
pywal_get() {
 python3.9 /usr/bin/wal -i "$1" -q -t
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
        sed -i -e "s/color1 .*./color1 ${FG:1}/g" $LCONKY
        sed -i -e "s/color2 .*./color2 ${SH8:1}/g" $LCONKY
        sed -i -e "s/color1 .*./color1 ${FG:1}/g" $RCONKY
        sed -i -e "s/color2 .*./color2 ${SH8:1}/g" $RCONKY
        sed -i -e "s/own_window_colour .*./own_window_colour ${BG:1}/g" $LCONKY
        sed -i -e "s/own_window_colour .*./own_window_colour ${SH5:1}/g" $RCONKY
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH4}FF;
	  bg4:   ${SH5}FF;
	  fg:    ${FG}FF;
	}
	EOF

	polybar-msg cmd restart

}

# Main
if [[ -f "/usr/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`

		FGA=`printf "%s\n" "$color8"`
		SH1=`printf "%s\n" "$color1"`
		SH2=`printf "%s\n" "$color2"`
		SH3=`printf "%s\n" "$color1"`
		SH4=`printf "%s\n" "$color2"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color7"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi
