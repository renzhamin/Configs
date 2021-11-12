#!/bin/bash

mons=$(xrandr --listmonitors | sed -n '1 s/Monitors: \([0-9]\+\)/\1/p')

if [ ${mons} -gt 1 ]; then
    xrandr --output HDMI-1 --off
    killall x11vnc
    exit 1
fi

xrandr --newmode "2336x1080_60.00"  210.36  2336 2488 2736 3136  1080 1081 1084 1118  -HSync +Vsync

xrandr --addmode HDMI-1 "2336x1080_60"

xrandr --output HDMI-1 --mode 2336x1080_60.00 --right-of eDP-1

x11vnc -clip 2336x1080+1366+0 & disown
