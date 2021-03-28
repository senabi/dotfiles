#!/usr/bin/env fish

### Variables
set powermenu_theme ~/.config/rofi/powermenu.rasi
set confirm_prompt_theme ~/.config/rofi/confirm.rasi
set uptime (uptime -p | sed -e 's/up //g') 
set focused (swaymsg -t get_outputs | jq 'map(.focused) | reverse  | index(true)')

### Power Options
set shutdown 󰐥
set reboot 󰜉
set lock 󰌾
set suspend 󰤄
set logout 󰍃

### Confirmation
function confirm_exit
	rofi -dmenu -i -no-fixed-num-lines -p "Are You Sure? [y/n] ● " -theme $confirm_prompt_theme -monitor $focused
end

### Icon Menu
set options $shutdown\n$reboot\n$lock\n$suspend\n$logout
### Answer
set chosen (echo -e $options | rofi -theme $powermenu_theme -p 'Goodbye, '$USER -dmenu -selected-row 2 -monitor $focused)

switch $chosen
	case $shutdown
		set ans (confirm_exit)
		if test $ans = 'y'
			systemctl poweroff
		else if test $ans = 'n'
			exit 0
		end
	case $reboot
		set ans (confirm_exit)
		if test $ans = 'y'
			systemctl reboot
		else if test $ans = 'n'
			exit 0
		end
	case $lock
		swaylock
	case $suspend
		set ans (confirm_exit)
		if test $ans = 'y'
			playerctl pause
			systemctl suspend
		else if test $ans = 'n'
			exit 0
		end
	case $logout	
		set ans (confirm_exit)
		if test $ans = 'y'
			killall sway
		else if test $ans = 'n'
			exit 0
		end
end
