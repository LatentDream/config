# List available recipes
default:
    @just --list

# Install Rust
install-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Homebrew (for macOS)
install-homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Cargo utilities
install-cargo-utils:
    cargo install ripgrep --locked
    cargo install zoxide --locked
    cargo install bat --locked
    cargo install just --locked
    cargo install yazi-fm yazi-cli --locked
    cargo install silicon --locked
    cargo install lsd --locked
    cargo install git-delta

# Install Go
install-go:
    wget https://go.dev/dl/go1.21.7.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.21.7.linux-amd64.tar.gz
    rm go1.21.7.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    source ~/.bashrc

# Install Go (macOS)
install-go-mac:
    brew install go

# Install system packages (Ubuntu/Debian)
install-system-packages-debian:
    sudo apt update
    sudo apt install -y fzf unzip clangd gcc

# Install system packages (macOS)
install-system-packages-mac:
    brew install fzf unzip gcc

# Install Lazygit
install-lazygit:
    go install github.com/jesseduffield/lazygit@latest

# Install Lazydocker
install-lazydocker:
    go install github.com/jesseduffield/lazydocker@latest

# Install Tmux package manager
install-tmux-plugin-manager:
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/tpm

# Append .bashrc content
append-bashrc:
    cat ~/.config/.bashrc >> ~/.bashrc

# Append .gitconfig content
append-gitconfig:
    cat ~/.config/.gitconfig >> ~/.gitconfig

# Install Glow (optional)
install-glow:
    go install github.com/charmbracelet/glow@latest

# Install Rectangle (macOS only, optional)
install-rectangle:
    brew install --cask rectangle

# Run all installation steps
install-all: install-rust install-go install-cargo-utils install-system-packages-debian install-lazygit install-lazydocker install-tmux-plugin-manager append-bashrc append-gitconfig

# Run all installation steps for macOS
install-all-mac: install-rust install-go-mac install-homebrew install-cargo-utils install-system-packages-mac install-lazygit install-lazydocker install-tmux-plugin-manager append-bashrc append-gitconfig install-rectangle
