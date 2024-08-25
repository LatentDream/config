# My Personal Aliases ----------
alias st='git status'
alias lt='du -sh * | sort -h'
alias mnt='mount | grep -E ^/dev | column -t'
alias gh='history|grep'
alias va='source ./venv/bin/activate'
alias tcn='mv --force -t ~/.local/share/Trash '
alias startgit='cd `git rev-parse --show-toplevel` && git checkout main && git pull'
alias cg='cd `git rev-parse --show-toplevel`'
alias v='nvim'
alias y='yazi'
alias lg='lazygit'
alias ld='lazydocker'
alias ls='lsd -lgX --group-dirs first'
alias ll='ls -alF'
alias la='ls -A'

# Enable fzf and z / zi ---------
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# Yazi sub-shell ----------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	    builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
