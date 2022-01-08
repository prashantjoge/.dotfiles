
#!/usr/bin/bash
#case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
#  [23]) echo "HTTP connectivity is up";;
#  5) echo "The web proxy won't let us through";;
#  *) echo "The network is down or very slow";;
#esac

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
RED='\e[32m'
NC='\033[0m' # No Color
ssid=""
pw=""
printf " \n"
printf "${RED} Scanning your network... Please wait...${NC}\n"
printf ".......................\n"
#printf "I ${RED}love${NC} Stack Overflow\n"
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  nmcli dev wifi
  read -p  'Prefereed SSID (network):'  ssid
  read -sp 'Password for the n/w:' pa
  echo
  printf "${RED}Setting up your preferred n/w: $ssid ${NC}\n"
  printf ".......................\n"
  sed -i "s/<network>/$ssid/g" ~/test.del
  sed -i "s/<password>/$pa/g" ~/test.del
  # chmod +x scriptname
  echo "Network with $ssid is up"
else
  echo "Network is down"
  nmcli dev wifi
  # exec startlxde-pi
fi
#test=google.com
#if nc -zw1 $test 443 && echo |openssl s_client -connect $test:443 2>&1 |awk 'handshake && $1 == "Verification" { if ($2=="OK") exit; exit 1 }
#  $1 $2 == "SSLhandshake" { handshake = 1 }'
#then
#  echo "we have connectivity"
#fi
#network={
#  ssid="<NETWORK NAME!>"
#  proto=WPA2
#  key_mgmt=WPA-PSK
#  pairwise=CCMP
#  group=CCMP
#  eap=TLS
#  psk="<NETWORK PASSWORD!>"
#  priority=2
#}
# CTRL-ALT-F7 or F8 should take you back to LXDE.
