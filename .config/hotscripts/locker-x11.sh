#!/bin/sh

exec xautolock -detectsleep -time 10 -locker "betterlockscreen -l dim -t 'What are you doing step bro?~'" -notify 30 -notifier "notify-send -u critical -t 10000 -- 'Locking screen in 30 sec.'" &
exec xidlehook --not-when-fullscreen --timer 1200 "systemctl suspend" &
