#!/bin/sh

#setxkbmap -layout us,es grp:lctrl_lwin_toggle

#input settings
setxkbmap -option caps:escape
xset r rate 300 50
xinput --set-prop 9 'libinput Accel Profile Enabled' 0, 1
xset m 0 0

# background
~/.fehbg &

#pointer pos
xsetroot -cursor_name left_ptr

# polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec bspwm

#feh --bg-fill ~/.wallpapers/background
#~/.local/bin/eww kill
#~/.local/bin/eww daemon
#~/.local/bin/eww open bar
#dwmblocks &
#dunst &
#picom &
