# My Personal Aliases ----------
# Utils
alias lt='du -sh * | sort -h'
alias hg='history|grep'
alias mnt='mount | grep -E ^/dev | column -t'
alias va='source ./venv/bin/activate'
alias tcn='mv --force -t ~/.local/share/Trash '
# Git
alias gw='git worktree list'
alias st='git status'
alias startgit='cd `git rev-parse --show-toplevel` && git checkout main && git pull'
alias cg='cd `git rev-parse --show-toplevel`'
alias adog='git log --all --decorate --oneline --graph'
# Tmux
alias t='tmux'
# Software
alias v='nvim'
alias y='yazi'
alias lg='lazygit'
alias ld='lazydocker'
# ls
alias ls='lsd -lgX --group-dirs first --no-symlink'
alias ll='ls -alF'
alias la='ls -A'
eval "$(zoxide init bash)"
# kubectl
alias k='kubectl'
alias kd='kubectl describe'
alias kg='kubectl get'
# -------------------------------


# Enable fzf and z / zi ---------
if [[ -n "$BASH_VERSION" ]]; then
    # Running in Bash
    eval "$(zoxide init bash)"
    eval "$(fzf --bash)"
elif [[ -n "$ZSH_VERSION" ]]; then
    # Running in Zsh
    eval "$(zoxide init zsh)"
    eval "$(fzf --zsh)"
fi


# Tmux session start
alias tt='~/.config/scripts/create_tmux_session.sh'
alias ttc='~/.config/scripts/create_tmux_session.sh conda-start'
alias ttp='~/.config/scripts/create_tmux_session.sh poetry'


# Conda
alias conda-start='eval "$(/home/dream/.miniconda3/bin/conda shell.bash hook)"'
alias cs='eval "$(/home/dream/.miniconda3/bin/conda shell.bash hook)"'


# Yazi sub-shell ----------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}


# Default stuff -----------------
export EDITOR="/usr/bin/vim"

# User tools directory ----------
export PATH="$HOME/tools/:$PATH"

# Ctrl + f to find a folder + start session -------
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
if [[ -n "$BASH_VERSION" ]]; then
    # For Bash
    bind -x '"\C-g":"fzf_tmux_dirs"'  # Ctrl+g
    bind -x '"\C-f":"zi"'             # Ctrl+f
elif [[ -n "$ZSH_VERSION" ]]; then
    # For ZSH
    # Define widgets for the functions
    fzf_tmux_dirs_widget() {
        zle -I
        fzf_tmux_dirs
    }

    zi_widget() {
        zle -I
        zi
    }

    # Create ZLE widgets
    zle -N fzf_tmux_dirs_widget
    zle -N zi_widget

    # Bind keys to widgets
    bindkey '^g' fzf_tmux_dirs_widget  # Ctrl+g
    bindkey '^f' zi_widget              # Ctrl+f
fi

if [[ -n "$ZSH_VERSION" ]]; then
    zstyle ':completion:*:*:make:*' tag-order 'targets'
    autoload -U compinit && compinit
fi
