#!/usr/bin/env bash
# toggle_kb_layout.sh
# Put this in ~/bin and make executable

# define your layouts in order
layouts=( "us" "br" "us(intl)" )

# get current layout (fallback to first if unknown)
current=$(hyprctl getoption input:kb_layout -j 2>/dev/null | jq -r '.str' 2>/dev/null || echo "")
# find index of current
idx=0
for i in "${!layouts[@]}"; do
  if [[ "${layouts[$i]}" == "$current" ]]; then
    idx=$i
    break
  fi
done

# next layout index
next=$(( (idx + 1) % ${#layouts[@]} ))
next_layout="${layouts[$next]}"

# apply layout via hyprctl
hyprctl keyword input:kb_layout "$next_layout"

# show a brief notification so you know which one is active
# Requires: libnotify (notify-send) and jq (used above)
notify-send "Keyboard layout" "$next_layout" -t 1500