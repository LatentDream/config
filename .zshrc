source ~/.config/.bashrc

# zi & fzf
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# Makefile completion
zstyle ':completion:*:*:make:*' tag-order 'targets'
autoload -U compinit && compinit

# Define the function
fzf_tmux_dirs() {
    # Array of directories to search
    local search_dirs=("$@")
    
    # If no directories provided, set some defaults
    if [[ ${#search_dirs[@]} -eq 0 ]]; then
        search_dirs=(
            "$HOME/"
            "$HOME/repo" 
            "$HOME/tmp" 
            "$HOME/Documents/repo" 
            "$HOME/repo/tmp"
            "$HOME/repo/scripts.git/"
        )
    fi
    
    # Find directories and create a clean display format
    local selected_display=$(find "${search_dirs[@]}" -maxdepth 1 -type d 2>/dev/null | \
        sed "s|^$HOME/|~/|" | \
        fzf --height 60% --reverse --border \
            --preview 'ls -la $(echo {} | sed "s|^~/|$HOME/|")' \
            --preview-window 'right:50%:wrap')
    
    if [[ -n "$selected_display" ]]; then
        # Convert back to full path
        local selected_dir="${selected_display/#\~/$HOME}"
        local session_name=$(basename "$selected_dir" | tr . _)
        
        if [[ -z "$TMUX" ]]; then
            # Not in tmux - create new session with editor window
            tmux new-session -s "$session_name" -c "$selected_dir" -n Editor "nvim; $SHELL" \; \
                new-window -n Terminal \; \
                select-window -t Editor
        else
            # In tmux - create new window in current session
            tmux new-window -c "$selected_dir" -n "$(basename "$selected_dir")"
        fi
    fi
}

# Widget that inserts the command into the buffer and executes it
fzf_tmux_dirs_widget() {
    BUFFER="fzf_tmux_dirs"
    zle accept-line
}

zi_widget() {
    BUFFER="zi"
    zle accept-line
}

# Register widgets
zle -N fzf_tmux_dirs_widget
zle -N zi_widget

# Bind keys
bindkey '^g' fzf_tmux_dirs_widget  # Ctrl+g
bindkey '^f' zi_widget             # Ctrl+f


