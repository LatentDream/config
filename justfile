# List available recipes
default:
    @just --list

# Install Rust
install-rust:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Homebrew (for macOS)
install-homebrew:
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install system packages (Ubuntu/Debian)
install-system-packages-ubuntu:
    sudo apt update
    sudo apt install -y unzip clangd gcc
    sudo apt install -y build-essential
    sudo apt install -y pkg-config
    sudo apt install -y libfontconfig1-dev
    sudo apt install -y libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all

# Install Neovim on Ubuntu (Stable by default, Nightly if specified)
install-nvim-ubuntu version="stable":
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p ~/tools
    cd ~/tools
    if [ "{{version}}" = "nightly" ]; then
        echo "Installing Neovim Nightly version..."
        DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
    else
        echo "Installing Neovim Stable version..."
        DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz"
    fi
    wget $DOWNLOAD_URL
    tar xzvf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    if ! grep -q 'export PATH="$HOME/tools/nvim-linux64/bin:$PATH"' ~/.bashrc; then
        echo 'export PATH="$HOME/tools/nvim-linux64/bin:$PATH"' >> ~/.bashrc
        echo "Added Neovim to PATH in .bashrc"
    else
        echo "Neovim path already in .bashrc"
    fi
    echo "Please run 'source ~/.bashrc' or start a new terminal session to use nvim"
    ~/tools/nvim-linux64/bin/nvim --version

# Update Neovim
update-nvim:
    @just install-nvim-ubuntu

# Remove Neovim
uninstall-nvim:
    #!/usr/bin/env bash
    set -euo pipefail
    rm -rf ~/tools/nvim-linux64
    sed -i '/export PATH="$HOME\/tools\/nvim-linux64\/bin:\$PATH"/d' ~/.bashrc
    echo "Neovim has been uninstalled. Please restart your terminal or run 'source ~/.bashrc'"

# Install Cargo utilities
install-cargo-utils:
    cargo install ripgrep --locked
    cargo install zoxide --locked
    cargo install bat --locked
    cargo install just --locked
    cargo install yazi-fm yazi-cli --locked
    cargo install lsd --locked
    cargo install git-delta
#    cargo install silicon

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

# Install system packages (macOS)
install-system-packages-mac:
    brew install fzf unzip gcc

# Install Lazy (lazygit and lazydocker)
install-lazy:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p ~/tools/go
    export GOPATH=~/tools/go
    export PATH=$PATH:$GOPATH/bin
    go install github.com/jesseduffield/lazygit@latest
    go install github.com/jesseduffield/lazydocker@latest
    if ! grep -q 'export PATH="$HOME/tools/go/bin:$PATH"' ~/.bashrc; then
        echo 'export PATH="$HOME/tools/go/bin:$PATH"' >> ~/.bashrc
        echo "Added Lazy tools to PATH in .bashrc"
    else
        echo "Lazy tools path already in .bashrc"
    fi
    echo "Please run 'source ~/.bashrc' or start a new terminal session to use lazygit and lazydocker"
    echo "NOTE: If you get an error claiming that lazygit cannot be found or is not defined,"
    echo "you may need to manually add '~/tools/go/bin' to your \$PATH in your shell configuration file."

# Install Tmux package manager and config
install-tmux:
    cp ./.tmux.conf ~/.tmux.conf
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Append .bashrc content
append-bashrc:
    cat ~/.config/.bashrc >> ~/.bashrc

# Append .gitconfig content
append-gitconfig:
    cat ~/.config/.gitconfig >> ~/.gitconfig

# Install Glow (optional)
install-glow:
    #!/usr/bin/env bash
    set -euo pipefail
    mkdir -p ~/tools/go
    export GOPATH=~/tools/go
    export PATH=$PATH:$GOPATH/bin
    go install github.com/charmbracelet/glow@latest
    if ! grep -q 'export PATH="$HOME/tools/go/bin:$PATH"' ~/.bashrc; then
        echo 'export PATH="$HOME/tools/go/bin:$PATH"' >> ~/.bashrc
        echo "Added Glow to PATH in .bashrc"
    else
        echo "Glow path already in .bashrc"
    fi
    echo "Please run 'source ~/.bashrc' or start a new terminal session to use glow"
    echo "NOTE: If you get an error claiming that glow cannot be found or is not defined,"
    echo "you may need to manually add '~/tools/go/bin' to your \$PATH in your shell configuration file."

# Install Rectangle (macOS only, optional)
install-rectangle:
    brew install --cask rectangle

# Run all installation steps
install-all: install-rust install-system-packages-ubuntu install-cargo-utils install-nvim-ubuntu append-bashrc append-gitconfig install-go install-lazy install-glow install-tmux

# Run all installation steps for macOS
install-all-mac: install-rust install-go-mac install-homebrew install-cargo-utils install-system-packages-mac install-lazy install-lazy install-tmux append-bashrc append-gitconfig install-rectangle
