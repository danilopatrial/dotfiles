#!/bin/bash

# Function to escape Pango markup characters
escape_pango() {
    sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'
}

title=$(playerctl metadata title 2>/dev/null | escape_pango)
artist=$(playerctl metadata artist 2>/dev/null | escape_pango)

if [ -n "$title" ] && [ -n "$artist" ]; then
    echo "$artist - $title"
elif [ -n "$title" ]; then
    echo "$title"
else
    echo ""
fi
