!#/usr/bin/env bash

if ! command -v jq >/dev/null 2>&1; then
    i3-msg 'exec notify-send "jq is not installed"'
fi

f_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused == true) | .name')

unf_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused == false and .visible == true) | .name')

i3-msg "move workspace to output next; workspace \"$unf_ws\"; move workspace to output next; workspace \"$unf_ws\""

