#!/bin/bash

# Git keys
eval $(ssh-agent); ssh-add ~/.ssh/github

# Run Lazygit
lazygit

# After Lazygit exits, send keys to kill the window
tmux send-keys "exit" C-m
