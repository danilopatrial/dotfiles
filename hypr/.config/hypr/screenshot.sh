#!/bin/bash
region=$(slurp)
if [ -z "$region" ]; then
  exit 1
fi

filename=~/Pictures/screenshot-$(date +%F-%T).png
grim -g "$region" "$filename" && wl-copy < "$filename"
