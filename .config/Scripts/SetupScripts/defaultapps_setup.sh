#!/bin/bash

declare -A mp

[ $# -eq 0 ] && (echo "specify argument, arch or deb") && exit 1;

if [ $1 == "arch" ]; then
    mp=( 
        [terminal]="alacritty" 
        [filemanager]="pcmanfm"
        [browser]="brave"
    )
elif [ $1 == "mint" ]; then
    mp=( 
        [terminal]="terminator" 
        [filemanager]="nemo"
        [browser]="brave-browser"
    )
fi

mkdir -p ~/.config/DefaultApps
cd ~/.config/DefaultApps

for key in ${!mp[@]}; do
    echo "/usr/bin/${mp[$key]}" "${key}"
done
