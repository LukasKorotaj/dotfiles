#!/bin/bash
# Define the list of workspaces to cycle through
workspaces=("11" "12" "13" "14")

# Get the name of the currently focused workspace using i3-msg and jq
current=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Initialize current_index to -1 (not found)
current_index=-1

# Loop through the workspaces array to find the index of the current workspace
for i in "${!workspaces[@]}"; do
    if [[ "${workspaces[$i]}" == "$current" ]]; then
        current_index=$i
        break
    fi
done

# If the current workspace is not one of the targeted workspaces, default to the first one
if [[ $current_index -eq -1 ]]; then
    next_index=0
else
    # Calculate the next index, wrapping around with modulo arithmetic
    next_index=$(( (current_index + 1) % ${#workspaces[@]} ))
fi

# Switch to the next workspace
i3-msg workspace "${workspaces[$next_index]}"
