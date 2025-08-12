#!/usr/bin/env bash

CLASS_NAME="textGod"
SOCKET_FILE="/tmp/nvimpipe-textGod"

copy_to_clipboard() {
    if [ -f "$1" ]; then
        if command -v wl-copy &>/dev/null; then
            cat "$1" | wl-copy
        elif command -v xclip &>/dev/null; then
            cat "$1" | xclip -selection clipboard
        fi
    fi
}

# Function to check if window exists
window_exists() {
    hyprctl clients | grep -q "class: $CLASS_NAME"
}

if window_exists; then
    # Window open -> save and quit Neovim via RPC
    if [ -S "$SOCKET_FILE" ]; then
        nvim --server "$SOCKET_FILE" --remote-send '<C-\><C-N>:w<CR>:q<CR>'
        sleep 0.3
        LAST_FILE=$(ls -t /tmp/textGod-*.md 2>/dev/null | head -n 1)
        copy_to_clipboard "$LAST_FILE"
        
        wtype $(wl-paste)
    fi
else
    TMP_FILE=$(mktemp --suffix=.md /tmp/textGod-XXXXXX)
    
    # Start inotify watcher
    inotifywait -mq -e close_write "$TMP_FILE" &
    WATCH_PID=$!

    # Start watchdog to kill watcher if window closes
    (
        while true; do
            sleep 0.5
            if ! window_exists; then
                kill "$WATCH_PID" 2>/dev/null
                break
            fi
        done
    ) &

    WATCHDOG_PID=$!

    kitty --class "$CLASS_NAME" nvim --listen "$SOCKET_FILE" "+startinsert" "$TMP_FILE"

    kill "$WATCH_PID" "$WATCHDOG_PID" 2>/dev/null
    rm -f "$SOCKET_FILE"
fi
