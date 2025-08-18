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
    
    [[ ! -d "$target_path" ]] && mkdir -p "$target_path"
    
    find "$rel_path" -maxdepth 1 -type f | while read -r file; do
        filename=$(basename "$file")
        source_file="$dotfiles_dir/$rel_path/$filename"
        target_file="$target_path/$filename"
        
        # Remove symlink if it exists
        if [[ -L "$target_file" ]]; then
            echo "Removing symlink: $target_file"
            rm "$target_file"
        fi
        
        # Copy file
        if [[ -e "$target_file" ]]; then
            echo "Warning: $target_file already exists - skipping"
        else
            cp "$source_file" "$target_file"
            echo "Copied: $source_file -> $target_file"
        fi
    done
done
