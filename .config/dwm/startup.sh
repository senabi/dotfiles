#!/bin/sh

setxkbmap -option caps:escape &
xset r rate 300 50 &
xinput --set-prop 9 'libinput Accel Profile Enabled' 0, 1 &
xset m 0 0 &
#VM
#xrandr --size 1920x1080
/usr/lib/polkit-kde-authentication-agent-1 &
dwmblocks &
dunst &
picom &
~/.fehbg &
rm /tmp/vol; mkfifo /tmp/vol && echo "$(pulsemixer --get-volume | awk '{print $1}')" > /tmp/vol & 
rm /tmp/vol-icon; mkfifo /tmp/vol-icon && ~/.config/hotscripts/eww_vol_icon.sh mute &
eww daemon &
~/.fehbg &
~/.config/hotscripts/locker-x11.sh &
exec dwm
