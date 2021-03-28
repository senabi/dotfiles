#!/usr/bin/env sh

while xsetroot -name "`date` `uptime`"
do
    sleep 1
done &

setxkbmap -option caps:escape &
xset r rate 300 50 &
xinput --set-prop 9 'libinput Accel Profile Enabled' 0, 1 &
xset m 0 0 &
dunst &
feh --no-fehbg --bg-center ~/.wallpapers/background &
picom &
