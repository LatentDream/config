#!/usr/bin/env bash

# Function to open or switch to tmux session for selected directory
fzf_tmux_dirs() {
    # Array of directories to search (customize these)
    local search_dirs=(
        "$HOME/"
        "$HOME/repo" 
        "$HOME/tmp" 
        "$HOME/Documents/repo" 
        "$HOME/repo/tmp"
        "$HOME/repo/scripts.git/"
    )
    
    # Find directories and create a clean display format
    local selected_display=$(find "${search_dirs[@]}" -maxdepth 1 -type d 2>/dev/null | \
        sed "s|^$HOME/||" | \
        sort | \
        fzf --height 100% --reverse \
            --preview 'ls -a $(echo {} | sed "s|^~/|$HOME/|")' \
            --preview-window 'right:50%:wrap')
    
    if [[ -n "$selected_display" ]]; then
        # Convert back to full path
        local selected_dir="${selected_display/#\~/$HOME}"
        local session_name=$(basename "$selected_dir" | tr . _)
        
        # Check if session already exists
        if tmux has-session -t "$session_name" 2>/dev/null; then
            # Session exists, switch to it
            tmux switch-client -t "$session_name"
        else
            # Create a new session with terminal first
            tmux new-session -d -s "$session_name" -c "$selected_dir" -n "Terminal"
            
            # Create editor window - important: use 'nvim .' to prevent immediate closure
            tmux new-window -d -t "$session_name" -c "$selected_dir" -n "Editor" "nvim ."
            
            # Select the Editor window
            tmux select-window -t "$session_name:Editor"
            
            # Switch to the new session
            tmux switch-client -t "$session_name"
        fi
    fi
}

# Execute the function
fzf_tmux_dirs
