#!/bin/sh


if [ -e ~/.mozilla/firefox/hvpdt6zj.default/places.sqlite_mine ];then
    echo "Restoring";
    mv ~/.mozilla/firefox/hvpdt6zj.default/places.sqlite_mine ~/.mozilla/firefox/hvpdt6zj.default/places.sqlite 
fi

scp len:~/.mozilla/firefox/qe63jwq4.default-release/places.sqlite ~/Temp

if [ "$?" -eq 0 ];then
    mv ~/.mozilla/firefox/hvpdt6zj.default/places.sqlite ~/.mozilla/firefox/hvpdt6zj.default/places.sqlite_mine
    cp ~/Temp/places.sqlite ~/.mozilla/firefox/hvpdt6zj.default/
else
    echo "Failed to copy"
fi
