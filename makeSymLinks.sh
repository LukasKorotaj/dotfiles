#!/usr/bin/env bash

#This is a test of the ln -sf command which should replace the .zshrc file with the symlink to the "right" .zshrc file from the repo.
#It works. I wont put comments for every single line. It is pretty self-explanatory.

ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc"
ls -l "$HOME/.zshrc"

ln -sf "$(pwd)/i3/config" "$HOME/.config/i3/"
ls -l "$HOME/.config/i3/config"

ln -sf "$(pwd)/sway/config" "$HOME/.config/sway/"
ls -l "$HOME/.config/sway/config"

for file in $(pwd)/kitty/*; do
  ln -sf "$file" $HOME/.config/kitty/
done

for file in $HOME/.config/kitty/*; do
   ls -l "$file" "$file"
done

ln -sf "$(pwd)/dunst/dunstrc" "$HOME/.config/dunst/"
ls -l "$HOME/.config/dunst/dunstrc"

ln -sf "$(pwd)/picom/picom.conf" "$HOME/.config/picom/"
ls -l "$HOME/.config/picom/picom.conf"

ln -sf "$(pwd)/redshift.conf" "$HOME/.config/"
ls -l "$HOME/.config/redshift.conf"

ln -sf "$(pwd)/ranger/rifle.conf" "$HOME/.config/ranger/"
ls -l "$HOME/.config/ranger/rifle.conf"

ln -sf "$(pwd)/rofi/config.rasi" "$HOME/.config/rofi/"
ls -l "$HOME/.config/rofi/config.rasi"

ln -sf "$(pwd)/i3status/config" "$HOME/.config/i3status/"
ls -l "$HOME/.config/i3status/config"
