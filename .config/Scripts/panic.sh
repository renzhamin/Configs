#!/bin/sh

x=$(xdotool get_desktop)

([ $x -eq 0 ] && \
    xdotool set_desktop 1) || \
([ $x -eq 1 ] && \
    xdotool set_desktop 0) 
