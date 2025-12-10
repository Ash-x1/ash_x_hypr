#!/bin/bash

# Initialize swww
swww init
sleep 1 # Ensure swww is ready

# Set default wallpaper (optional, replace with any default image)
DEFAULT_WALL="$HOME/Pictures/Wallpapers/default.jpg"
swww img "$DEFAULT_WALL"

# Make the default wallpaper ready for rofi magebox instantly
ln -sf "$DEFAULT_WALL" "$HOME/.config/rofi/current_rofi_wall/current_rofi_wall"

