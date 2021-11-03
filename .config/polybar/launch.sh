#!/usr/bin/env sh

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-spectrwm -c ~/.config/polybar/config &
  done
else
    polybar --reload mainbar-spectrwm -c ~/.config/polybar/config &
fi
