#!/usr/bin/env fish

set focused (swaymsg -t get_outputs | jq 'map(.focused) | reverse  | index(true)')
set theme ~/.config/rofi/launcher.rasi
rofi -show drun -modi drun,run,window -monitor $focused -theme $theme
