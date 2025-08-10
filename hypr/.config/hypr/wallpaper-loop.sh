#!/bin/bash

WALLPAPER_DIR="/home/apollo/.dotfiles/wallpapers"

while true; do
    for img in "$WALLPAPER_DIR"/*; do
        swaybg -i "$img" -m fill &
        PID=$!
        sleep 1000
        kill $PID
    done
done
