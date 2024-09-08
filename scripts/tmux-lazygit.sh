#!/bin/bash

# Run Lazygit
lazygit

# After Lazygit exits, send keys to kill the window
tmux send-keys "exit" C-m
