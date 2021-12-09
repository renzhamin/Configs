#!/bin/sh

run() {
    [ $(pgrep -u ${USER} ${1}) ] || ${1} &
}

nitrogen --set-zoom-fill ~/.config/wallpaper.jpeg &
xmodmap -e 'keycode 108=Escape'
run picom
run lxpolkit 
run nm-applet
# run /usr/lib/geoclue-2.0/demos/agent
killall redshift
redshift &
xinput disable "AT Translated Set 2 keyboard"
