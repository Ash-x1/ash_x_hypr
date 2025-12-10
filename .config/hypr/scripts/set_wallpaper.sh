#!/bin/bash

# =======================================================
# User configuration
# =======================================================
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
UPDATE_ROFI_SCRIPT="$HOME/.config/rofi/scripts/update-rofi-wall.sh"

# =======================================================
# Check if directory exists
# =======================================================
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# =======================================================
# Prepare wallpaper choices with icons for rofi preview
# =======================================================
choices=""
for img in "$WALLPAPER_DIR"/*.{jpg,png,gif}; do
    [ -f "$img" ] || continue
    filename=$(basename "$img")
    choices+="$filename\0icon\x1f$img\n"
done

chosen=$(echo -en "$choices" | rofi -dmenu -p "Wallpaper" -theme-str 'element-icon { size: 80px; }')

# =======================================================
# If wallpaper selected
# =======================================================
if [ -n "$chosen" ]; then
    selected_wallpaper="$WALLPAPER_DIR/$chosen"

    # 1. Change the wallpaper
    swww img "$selected_wallpaper" --transition-type random --transition-duration 3 --transition-fps 60

    # 2. Apply pywal theme
    wal -i "$selected_wallpaper" --backend wal

    # 3. Generate rofi colors automatically
    "$HOME/.config/rofi/scripts/wal-rofi-gen.sh"

    # 4. Reload waybar (if needed)
    pkill waybar
    sleep 0.3
    waybar &

    # 5. Save wallpaper path for other scripts
    echo "$selected_wallpaper" > ~/.cache/last_wallpaper

    # 6. Create direct symlink (optional, for other uses)
    ln -sf "$selected_wallpaper" "$HOME/.config/rofi/current_rofi_wall/current_rofi_wallpaper"

    # 7. UPDATE rofi imagebox thumbnail instantly
    if [ -x "$UPDATE_ROFI_SCRIPT" ]; then
        "$UPDATE_ROFI_SCRIPT"
    else
        echo "Warning: $UPDATE_ROFI_SCRIPT not found or not executable."
    fi

    # 8. Optional notification
    notify-send "🎨 Wallpaper & Rofi colors updated!"
fi

