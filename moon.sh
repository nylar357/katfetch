#!/bin/bash
# Tiny colored fetch script
# Requires Typicons Font to display the icons
# Deps : iwgetid (from wireless-tools package) & xprop 
# nylar357 @ github ADAPTED FROM : elenapan @ github

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
d=$'\e[1m'
t=$'\e[0m'
v=$'\e[7m'

# Items
sep=
s=$d$f0$sep$t

w=$(echo "  ")  
wifiname="$(iwgetid | cut -d \" -f2)"

h=$(echo " ") 
wmname="$(xprop -id $(xprop -root -notype | awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}') -notype -f _NET_WM_NAME 8t | grep "WM_NAME" | cut -f2 -d \")"

k=$(echo " ")
kernel="$(uname -r | cut -d '-' -f1)"

r=$(echo " 🖵 ") 



sh=$(echo " ")
shell=$(basename $SHELL)

ip=$(echo "󰖩 ")
ipchk=$(curl ipinfo.io | grep '"ip":' | awk '{print $2}' | sed 's/"//g' | sed 's/,//g')
ipchk2=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
# (\ /)
# ( · ·)
# c(")(")

# (\ /)
# ( . .)
# c(")(")

tput clear
cat <<EOF

	
	    $d$f1$h  $t$wmname
   (\ /)     $f3$k  $t$kernel
   ( $d. .$t)    $f2$sh  $t$shell
   c($f1"$t)($f1"$t)   $f5$ip $t$ipchk
	   $f3$w $t$wifiname

────────▄█▀▄   ｃｒｅａｔｅｄ ｂｙ ：
──────▄██▀▀▀▀▄   ɳყɬαɾ357
────▄███▀▀▀▀▀▀▀▄
──▄████▀▀▀▀▀▀▀▀▀▀▄
▄█████▀▀▀▀▀▀▀▀▀▀▀▀▀▄

EOF
