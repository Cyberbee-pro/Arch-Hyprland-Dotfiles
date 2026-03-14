#!/bin/bash

# Target Monitor
MONITOR="eDP-1"

# Get the current refresh rate (rounded to nearest integer)
# This grabs the "144.00" or "60.00" and turns it into "144" or "60"
CURRENT_RATE=$(hyprctl monitors | grep -A 2 "$MONITOR" | grep "refreshRate" | awk '{print int($2)}')

if [ "$CURRENT_RATE" -ge 100 ]; then
    # Switch to 60Hz
    hyprctl keyword monitor "$MONITOR, 1920x1080@60, 0x0, 1"
    notify-send -t 2000 "󰁹 Battery Mode" "Refresh rate set to 60Hz"
else
    # Switch to 144Hz (Change to 165 if your LOQ is 165Hz)
    hyprctl keyword monitor "$MONITOR, 1920x1080@144, 0x0, 1"
    notify-send -t 2000 "󰓓 Gaming Mode" "Refresh rate set to 144Hz"
fi