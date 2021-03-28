#!/bin/sh

rm /tmp/riverwob
mkfifo /tmp/riverwob && tail -f /tmp/riverwob | wob --border-color '#FF7A675E' --background-color '#00464646' --bar-color '#FF7A675E' &

if ! -z $SWAYSOCK; then
  riverctl spawn "swayidle -w\
    timeout 1070 'swaylock -f'\
    after-resume 'swaylock'"
fi
mako &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
~/.azotebg &
