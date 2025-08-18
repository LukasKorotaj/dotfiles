#!/usr/bin/env bash

# ==========================================
# Arch Update Script: pacman + AUR + Flatpak
# ==========================================

echo "Starting system update..."

# --- 1. Update pacman (official repos) ---
echo "Updating official Arch packages..."
sudo pacman -Syu --noconfirm

# --- 2. Update AUR packages (using yay) ---
if command -v yay &> /dev/null; then
    echo "Updating AUR packages..."
    yay -Syu --noconfirm
else
    echo "yay not found. Skipping AUR updates."
fi

# --- 3. Update Flatpak packages ---
if command -v flatpak &> /dev/null; then
    echo "Updating Flatpak packages..."
    flatpak update -y
else
    echo "Flatpak not found. Skipping Flatpak updates."
fi

echo "All updates complete!"
