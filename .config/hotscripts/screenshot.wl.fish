#!/usr/bin/env fish

mkdir -p ~/Pictures/screenshots/
set IMG ~/Pictures/screenshots/(date +'%F:%Hh%Mm%Ss').png

switch $argv[1]
	case "region"
		if test $argv[2] = 'fast'
			grim -g (slurp) $IMG && wl-copy < $IMG
			notify-send -t 5000 "Screenshot written and coppied" "$IMG"
		else
			grim -g (slurp) - | swappy -f -
		end
	case "all"
		if test $argv[2] = 'fast'
			grim $IMG && wl-copy < $IMG
			notify-send -t 5000 "Screenshot written and coppied" "$IMG"
		else
			grim - | swappy -f -
		end
	case "window"
		set active_window (swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
		if test $argv[2] = 'fast'
			grim -g $active_window $IMG && wl-copy < $IMG
			notify-send -t 5000 "Screenshot written and coppied" "$IMG"
		else
			grim -g $active_window - | swappy -f -
		end
	case "monitor"
		set active_monitor (swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
		if test $argv[2] = 'fast'
			grim -o $active_monitor $IMG && wl-copy < $IMG
			notify-send -t 5000 "Screenshot written and coppied" "$IMG"
		else
			grim -o $active_monitor - | swappy -f -
		end
	case "picker"
		set rgb_hex (grim -g (slurp -p) -t ppm - | convert - -format '%[pixel:p{0,0}]' txt: | tail -n +2 | awk '{print $3}')
		wl-copy $rgb_hex
		notify-send -t 5000 "Color Picker" "$rgb_hex was coppied to clipboard"
end
