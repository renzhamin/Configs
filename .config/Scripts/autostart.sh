#!/bin/sh

run() {
    [ $(pgrep -u ${USER} ${1}) ] || ${1} & disown
}

xinput disable "AT Translated Set 2 keyboard"
nitrogen --set-zoom-fill ~/.config/wallpaper.jpeg
xmodmap -e 'keycode 108=Escape'
run picom
run lxpolkit 
run nm-applet
run redshift
