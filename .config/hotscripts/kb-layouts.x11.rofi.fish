#!/usr/bin/env fish
set theme ~/.config/rofi/launcher.rasi
set kbchosen (localectl list-x11-keymap-layouts | rofi -theme $theme -p 'Layout' -dmenu)
setxkbmap $kbchosen
#setxkbmap -layout us,es grp:lctrl_lwin_toggle
