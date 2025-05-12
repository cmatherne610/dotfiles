#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

i=0
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    CMD="env MONITOR=${i} ~/.config/polybar/polybar-scripts/dwm-tags.sh"
    env TAG_CMD="$CMD" MONITOR="$m" polybar --reload top &
    i=$((i+1))
done	
