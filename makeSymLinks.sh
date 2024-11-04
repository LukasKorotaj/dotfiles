#!/bin/bash

#This is a test of the bash script 
#echo "Swag money"

#This is a test of the ln -sf command which should replace the .zshrc file with the symlink to the "right" .zshrc file from the repo.
#It works. I wont put comments for every single line. It is pretty self-explanatory.
ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc"
ls -l "$HOME/.zshrc"


ln -sf "$(pwd)/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
ls -l "$HOME/.config/alacritty/alacritty.toml"


for file in $(pwd)/.scripts/*; do
	ln -sf "$file" $HOME/.config/.scripts/
done

for file in $HOME/.config/.scripts/*; do 
	ls -l "$file"
done


ln -sf "$(pwd)/i3/config" "$HOME/.config/i3/"
ls -l "$HOME/.config/i3/config"


for file in $(pwd)/polybar/*; do 
	ln -sf "$file" $HOME/.config/polybar/
done

for file in $HOME/.config/polybar/*; do
	ls -l "$file"
done

ln -sf "$(pwd)/picom/picom.conf" "$HOME/.config/picom/"
ls -l "$HOME/.config/picom/picom.conf"

ln -sf "$(pwd)/redshift.conf" "$HOME/.config/"
ls -l "$HOME/.config/redshift.conf"

ln -sf "$(pwd)/ranger/rifle.conf" "$HOME/.config/ranger/"
ls -l "$HOME/.config/ranger/rifle.conf"
