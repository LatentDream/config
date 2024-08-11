# List and link to some useful tools
- This repo, nvim config
```bash
cargo install ripgrep --locked
cargo install zoxide --locked   # Check zoxide repo for init script
cargo install bat --locked
cargo install just --locked
cargo install yazi-fm yazi-cli --locked
cargo install silicon --locked
cargo install lsd --locked
```
- Lazy git: [lazygit](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#homebrew)
- Markdown reader: [Glow](https://github.com/charmbracelet/glow)
- MacOS window [manager](https://rectangleapp.com/): `brew install rectangle`
- Neofetch [Git repo](https://github.com/dylanaraps/neofetch)
- fzf
- tmux plugin manager `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
## Todo
- Could be a nice touch: https://github.com/L3MON4D3/LuaSnip
- aserowy/tmux.nvim


## Other:
Alias for bashrc
```
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
alias ls='lsd -lgX --group-dirs first'
alias lg='lazygit'
alias ld='lazydocker'
```
