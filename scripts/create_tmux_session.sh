#!/bin/bash

# Get the current folder name (handling folders with dots)
SESSION_NAME=$(basename "$PWD" | tr . _)

# Check if tmux is already running
tmux has-session -t "$SESSION_NAME" 2>/dev/null

# If the session doesn't exist, create it
if [ $? != 0 ]; then
    # Create a new session with the first window named "Editor"
    tmux new-session -d -s "$SESSION_NAME" -n "Editor"
    # Create a second window named "Terminal"
    tmux new-window -t "$SESSION_NAME" -n "Terminal"

    # Handle conda activation
    if [ "$1" = "conda-start" ]; then
        if [ -n "$2" ]; then
            # Activate specific conda environment
            tmux send-keys -t "$SESSION_NAME:Editor" "conda-start; conda activate $2" C-m
            tmux send-keys -t "$SESSION_NAME:Terminal" "conda-start; conda activate $2" C-m
        else
            # Default conda activation
            tmux send-keys -t "$SESSION_NAME:Editor" "conda-start; conda activate" C-m
            tmux send-keys -t "$SESSION_NAME:Terminal" "conda-start; conda activate" C-m
        fi
    fi

    # Handle poetry activation
    if [ "$1" = "poetry" ]; then
        tmux send-keys -t "$SESSION_NAME:Editor" "poetry shell" C-m
        tmux send-keys -t "$SESSION_NAME:Terminal" "poetry shell" C-m
    fi

    # Select the first window (Editor)
    tmux select-window -t "$SESSION_NAME:Editor"

    # Attach to the session
    tmux attach-session -t "$SESSION_NAME"
else
    echo "Session $SESSION_NAME already exists"
    # If the session exists, attach to it and select the first window
    tmux attach-session -t "$SESSION_NAME"
    tmux select-window -t "$SESSION_NAME:Editor"
fi
