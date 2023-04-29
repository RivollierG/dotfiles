#!/bin/bash




# Lock screen immediately
swaylock --image ~/Pictures/wallpapers/sunset.jpg


# If idle for 15s, power down the output
swayidle -w \
		timeout 15 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' &

# Kill the last instance of swayidle so the timer doesn't keep running in background
pkill --newest swayidle
