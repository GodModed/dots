#!/bin/bash

# Get the list of windows
windows=$(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.type=="con") | select(.name!=null) | "\(.id) \(.name)"')

# Show windows in Wofi and get user selection
selected=$(echo "$windows" | wofi --dmenu -p "Select Window" -i)

# Extract the window ID from the selection
window_id=$(echo "$selected" | awk '{print $1}')

# Focus the selected window
swaymsg [con_id="$window_id"] focus