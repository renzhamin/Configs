#!/bin/sh
nitrogen --restore
xinput float 17
xmodmap -e 'keycode 108=Escape'
picom &
/usr/bin/lxpolkit & 
/usr/lib/geoclue-2.0/demos/agent &
redshift &
# brave &
