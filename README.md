# Development Environment Setup

Always a `WIP` :)

![demo](./demo.png)

- [Neovim](./nvim/)
- [tmux](./.tmux.conf)
- [Alacritty](./alacritty/)
- [lsd](./lsd/)
- [yazi](./yazi/)
- [Some scripts](./scripts/)
- [Some cool icons](./assets/)


## Prerequisites

Ensure you have the following installed:
- Git
- Curl or Wget

## Quick Start

1. Install Just:
   ```bash
   # On macOS
   brew install just

   # On Ubuntu/Debian
   sudo apt-get update
   sudo apt-get install just

   # Using cargo (Rust's package manager)
   cargo install just
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/LatentDream/config ~/.config
   ```

3. Navigate to the cloned directory:
   ```bash
   cd ~/.config
   ```

4. Run the installation:
   ```bash
   # For Linux (Debian/Ubuntu)
   just install-all

   # For macOS
   just install-all-mac
   ```

5. Restart your terminal or source your `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

6. For tmux, open a tmux session and press `prefix` + `I` (capital i) to install the plugins.

## Detailed Installation Steps

The `justfile` automates most of the installation process. Here's what it does:

1. Clones this configuration repository
2. Installs Rust
3. Installs Go
4. Installs various Cargo utilities (ripgrep, zoxide, bat, just, yazi, silicon, lsd, git-delta)
5. Installs system packages (fzf, unzip, clangd, gcc)
6. Installs Lazygit and Lazydocker
7. Sets up Tmux plugin manager
8. Appends necessary configurations to .bashrc and .gitconfig

### Manual Steps

After running the automated installation, you may need to:

1. Restart your terminal or source your `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

3. For Neovim, open Neovim and it should automatically install plugins on first run.

## Optional Installations

The justfile includes recipes for some optional tools:

- Glow: A terminal-based markdown reader
  ```bash
  just install-glow
  ```

- Rectangle (macOS only): A window manager
  ```bash
  just install-rectangle
  ```

## Acknowledgements

**Special thanks to**:
- That person who wrote the obscure blog post that solved that one weird bug (happened multiple times)
