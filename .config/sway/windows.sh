#!/bin/sh

swaymsg -t get_tree | jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " "+ (.app_id | tostring) + " " + .name)' | wofi --show dmenu | { read -r id app_id name; swaymsg "[con_id=$id]" focus; }
