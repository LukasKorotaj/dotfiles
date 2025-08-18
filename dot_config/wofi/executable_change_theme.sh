#!/bin/bash

# Show theme selection menu - using minimal style to avoid theme errors
choice=$(wofi --dmenu --prompt="Choose theme" --style="" << EOF
Light
Dark
Custom Light
Custom Dark
EOF
)

# Handle user selection
case $choice in
    "Light")
        envsubst < $DOTFILES/../resources/themes/matugen/config.toml.tpl > $DOTFILES/../resources/themes/matugen/config.toml
        wallpaper="$DOTFILES/../resources/themes/wallpapers/light.jpg"
        matugen_cmd="matugen image '$wallpaper' -c '$DOTFILES/../resources/themes/matugen/config.toml' --mode 'light'"
        ;;
    "Dark")
        envsubst < $DOTFILES/../resources/themes/matugen/config.toml.tpl > $DOTFILES/../resources/themes/matugen/config.toml
        wallpaper="$DOTFILES/../resources/themes/wallpapers/dark.png"
        matugen_cmd="matugen image '$wallpaper' -c '$DOTFILES/../resources/themes/matugen/config.toml'"
        ;;
    "Custom Light"|"Custom Dark")
        envsubst < $DOTFILES/../resources/themes/matugen/config.toml.tpl > $DOTFILES/../resources/themes/matugen/config.toml
        # Use zenity as a fallback for file selection
        if command -v zenity &> /dev/null; then
            wallpaper=$(zenity --file-selection --title="Select wallpaper image" --file-filter="Image files | *.jpg *.jpeg *.png")
        else
            # Fallback to simple find + wofi if zenity not available
            wallpaper=$(find "$HOME/Pictures" "$DOTFILES/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | wofi --dmenu --prompt="Select wallpaper")
        fi
        
        if [ -z "$wallpaper" ]; then
            notify-send "Theme Switch" "No image selected"
            exit 1
        fi
        
        # Verify it's an image file
        if ! file -b --mime-type "$wallpaper" | grep -qE '^image/'; then
            notify-send "Invalid Selection" "Please select an image file (JPG/PNG)"
            exit 1
        fi
        
        if [ "$choice" = "Custom Light" ]; then
            matugen_cmd="matugen image '$wallpaper' -c '$DOTFILES/../resources/themes/matugen/config.toml' --mode 'light'"
        else
            matugen_cmd="matugen image '$wallpaper' -c '$DOTFILES/../resources/themes/matugen/config.toml'"
        fi
        ;;
    *)
        echo "No theme selected"
        exit 1
        ;;
esac

# Update hyprpaper.conf
hyprpaper_conf="$DOTFILES/hypr/hyprpaper.conf"

# Escape path for sed
escaped_wallpaper=$(printf '%s\n' "$wallpaper" | sed 's:[][\/.^$*]:\\&:g')

# Update config file
if [ -f "$hyprpaper_conf" ]; then
    sed -i \
        -e "s|^preload = .*|preload = $escaped_wallpaper|" \
        -e "s|^wallpaper = ,.*|wallpaper = ,$escaped_wallpaper|" \
        "$hyprpaper_conf"
else
    notify-send "Config Error" "Hyprpaper config not found at $hyprpaper_conf"
    exit 1
fi

# Execute matugen command
eval "$matugen_cmd"
sync
chezmoi apply --force

# Restart hyprpaper
if pgrep hyprpaper > /dev/null; then
    pkill hyprpaper
    sleep 0.1
fi
hyprpaper &>/dev/null &

# Send notification
notify-send "Theme Switched" "Active theme: $choice\nWallpaper: $(basename "$wallpaper")" --icon=preferences-desktop-theme
