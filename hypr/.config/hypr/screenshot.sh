#!/bin/bash
region=$(slurp)
if [ -z "$region" ]; then
  notify-send "Screenshot cancelled"
  exit 1
fi

filename=~/Pictures/screenshot-$(date +%F-%T).png
grim -g "$region" "$filename" && wl-copy < "$filename"
notify-send "Screenshot saved and copied"
