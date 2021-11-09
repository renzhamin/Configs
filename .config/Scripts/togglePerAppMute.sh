#!/bin/sh

pactl list sink-inputs | grep -i $(xdotool getwindowfocus getwindowclassname) -B 20 | grep "Sink Input #" | sed -n 's/Sink Input #\([0-9]\+\)/\1/p' | xargs -I {} pactl set-sink-input-mute {} toggle
