#!/bin/sh

#setxkbmap -layout us,es grp:lctrl_lwin_toggle

#input settings
setxkbmap -option caps:escape
xset r rate 300 50
xinput --set-prop 9 'libinput Accel Profile Enabled' 0, 1
xset m 0 0

setxkbmap -layout us,es -option grp:alt_shift_toggle

# background
picom &
~/.fehbg &
~/.config/polybar/launch.sh &

#pointer pos
xsetroot -cursor_name left_ptr

#startxfce4 &
#if pgrep -x "xfwm4" > /dev/null
#then
#    pkill xfwm4
#fi

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
