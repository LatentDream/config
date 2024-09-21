```
                                              _,--._.-,
                                              /\_r-,\_ )
                                           .-.) _;='_/ (.;
                                            \ \'     \/S )
                                            L.'-. _.'|-'
                                              <_`-'\'_.'/
                                              `'-._( \
                                           ___   \\,      ___
                                          \ .'-. \\   .-'_. /
                                           '._' '.\\/.-'_.'
                                              '--``\('--'
                                                   \\
                                                  `\\,
                                                    \|

```
<p align="center">
   <h1 align="center"><b>Development Environment Setup</b></h1>
   <p align="center">
      <br />
      <!--<a href="https://latent.blog"><strong>By Gui »</strong></a>-->
  </p>
</p> 

- [Neovim](./nvim/)
- [tmux](./.tmux.conf)
- [Alacritty](./alacritty/)
- [lsd](./lsd/)
- [yazi](./yazi/)
- [Some scripts](./scripts/)
- [Some cool icons](./assets/)

## Quick Start

1. Install Just:
   ```bash
   # Make sure the following are install:
   # - Git
   # - curl or wget

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
5. Installs system packages (fzf, unzip, clangd, gcc)
4. Installs various Cargo utilities (ripgrep, zoxide, bat, just, yazi, silicon, lsd, git-delta)
   - TODO: Fix silicon
6. Installs Lazygit and Lazydocker
7. Sets up Tmux plugin manager
8. Appends necessary configurations to .bashrc and .gitconfig

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

## WSL Setup

1. Move `./wsl-selector.ps1` to `~/` of your profile
2. Move `./alacritty/*` to `~/AppData/roaming/alacritty/*`
3. Un-comment the lauch of the `wsl-selector.ps1` script

## Screenshot

![demo](./demo.png)

## TODO:
- [ ] Add a git blame in nvim
