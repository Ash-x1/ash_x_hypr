#!/bin/bash

#choose wallpaper using swww
swww img "$1"

# set new colors in pywal
wal -i "$1" --backend wal

# generate waybar-compatible CSS
cp ~/.cache/wal/colors.css ~/.cache/wal/colors-waybar.css

# reload waybar
pkill -SIGUSR2 waybar

# reload kitty
killall -SIGUSR1 kitty

# reload hyprland borders/colors
hyprctl reload

# generate rofi colors
"$HOME/.config/rofi/scripts/wal-rofi-gen.sh"

