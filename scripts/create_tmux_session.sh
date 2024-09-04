#!/bin/bash

# Get the current folder name
SESSION_NAME=$(basename "$PWD")

# Check if tmux is already running
tmux has-session -t "$SESSION_NAME" 2>/dev/null

# If the session doesn't exist, create it
if [ $? != 0 ]; then
    # Create a new session with the first window named "Editor"
    tmux new-session -d -s "$SESSION_NAME" -n "Editor"

    # Create a second window named "Terminal"
    tmux new-window -t "$SESSION_NAME" -n "Terminal"

    # If conda-start parameter is provided, start conda in all windows
    if [ "$1" = "conda-start" ]; then
        tmux send-keys -t "$SESSION_NAME:Editor" "conda-start; conda activate" C-m
        tmux send-keys -t "$SESSION_NAME:Terminal" "conda-start; conda activate" C-m
    fi

    # If conda-start parameter is provided, start conda in all windows
    if [ "$1" = "poetry" ]; then
        tmux send-keys -t "$SESSION_NAME:Editor" "poetry shell" C-m
        tmux send-keys -t "$SESSION_NAME:Terminal" "poetry shell" C-m
    fi

    # Attach to the session
    tmux attach-session -t "$SESSION_NAME"
else
    echo "Session $SESSION_NAME already exists"
fi
