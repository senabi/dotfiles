#!/usr/bin/env bash

#source ~/.config/myscripts/dwm-status-bar.sh

#setxkbmap -layout us,es grp:lctrl_lwin_toggle
setxkbmap -option caps:escape
xset r rate 300 50
xinput --set-prop 9 'libinput Accel Profile Enabled' 0, 1
xset m 0 0
feh --bg-fill ~/.wallpapers/background
~/.local/bin/eww kill
~/.local/bin/eww daemon
~/.local/bin/eww open bar
#dwmblocks &
dunst &
picom &
