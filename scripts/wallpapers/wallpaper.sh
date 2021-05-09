#!/bin/bash

KEYWORD=wallpaper
NUMBER=$(( 1 + $RANDOM % 10 ))
IMAGE_TYPE=jpg
INTERVAL=3600
MODE=--bg-scale

WALLPAPER=~/.wallpapers/"$KEYWORD-$NUMBER.$IMAGE_TYPE"

while :; do
    # Change Wallpaper
    feh $MODE $WALLPAPER
    if [ "$?" -ne "0" ]; then
        exit 1
    fi
    sleep $INTERVAL
done
