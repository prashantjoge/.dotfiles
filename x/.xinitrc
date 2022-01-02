#! /bin/bash

###udiskie &

# echo -n $(date +%H:%M:%S)
# echo " "
export PATH="${PATH}:$HOME/.gem/ruby/2.4.0/bin"
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
##export DE="i3"
dbus-update-activation-environment --systemd --all
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK
# xset +fp /.local/share/fonts/           # Prepend a custom font path to Xorg's list of known font paths
# xset -fp /usr/share/fonts/sucky_fonts/     # Remove the specified font path from Xorg's list of known font paths


#echo -n $(date +%H:%M:%S)
#echo " "
#echo "finished .xinitrc"
#read -p "Pause Time 5 seconds" -t 5
#read -p "Continuing in 5 Seconds...." -t 5
#echo "Continuing ...."

#wal -i ~/wallpapers/colorful
exec i3
