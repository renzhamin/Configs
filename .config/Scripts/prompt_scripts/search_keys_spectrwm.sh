grep --text "bind\|program" ~/.config/spectrwm/spectrwm.conf | grep -v "#" | dmenu -i -l 20 -p "Key Bindings"
