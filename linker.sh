#!/bin/bash

dotfiles_dir="$PWD"
config_dir="$HOME/.config"

find . -mindepth 1 -type d \
    -not -path './utils*' \
    -not -path './.git*' \
    -not -path './sddm*' \
    -not -path './themes*' \
    -not -path './wallpapers*' \
    | while read -r dir; do
    rel_path="${dir#./}"
    target_path="$config_dir/$rel_path"
    
    if [[ ! -d "$target_path" ]]; then
        echo "Creating directory: $target_path"
        mkdir -p "$target_path"
    fi
    
    find "$rel_path" -maxdepth 1 -type f | while read -r file; do
        filename=$(basename "$file")
        source_file="$dotfiles_dir/$rel_path/$filename"
        target_file="$target_path/$filename"
        
        if [[ -e "$target_file" || -L "$target_file" ]]; then
            echo "Warning: $target_file already exists - skipping"
        else
            ln -s "$source_file" "$target_file"
            echo "Created symlink: $target_file -> $source_file"
        fi
    done
done
