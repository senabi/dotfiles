#!/bin/sh

# Update river-option
if [[ $2 =~ ^-?[0-9]+$ ]] ; then
  riverctl mod-option -focused-output $1 $2
else
  riverctl set-option -focused-output $1 "${@:2}"
fi

pkill -RTMIN+8 waybar

# Update river layout
riverctl layout rivertiler $(riverctl get-option -focused-output main_frame) \
  $(riverctl get-option -focused-output master_layout) \
  $(riverctl get-option -focused-output slave_layout) \
  $(riverctl get-option -focused-output main_index)
