# Dev Env Confgs
- [Neovim](./nvim/)
- [tmux](./.tmux.conf)
- [Alacritty](./alacritty/)
- [lsd](./lsd/)
- [yazi](./yazi/)
- [Some scripts](./scripts/)
- [Some cool icons](./assets/)


## Installation

1. Clone this repo 
```
git clone https://github.com/LatentDream/config ~/.config
```

2. Install dependencies
- [Rust](https://www.rust-lang.org/tools/install)
- Node - Depend on the platform
- On Mac, install the missing package manager: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

3. Install the utilities

```bash
# From Cargo - Build from source
cargo install ripgrep --locked
cargo install zoxide --locked   # Check zoxide repo for init script (already in `./.bashrc`)
cargo install bat --locked
cargo install just --locked
cargo install yazi-fm yazi-cli --locked
cargo install silicon --locked
cargo install lsd --locked
cargo install git-delta

# Package (`brew install on mac`)
sudo apt install fzf
sudo apt install unzip
sudo apt install clangd
sudo apt install gcc
```
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)

4. Install Tmux package manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/tpm
```

5. Add the content of the `.bashrc` of this repo to the system one for the shortcuts
```
cat ~/.config/.bashrc >> ~/.bashrc
```

6. Add the content of the `.gitconfig` of this repo to the system one to modify `git diff` `git show` ... output with `delta`
```
cat ~/.config/.gitconfig >> ~/.gitconfig
```


7. _Optional_
- Terminal Markdown Reader: [Glow](https://github.com/charmbracelet/glow)
- MacOS Window Manager: [Rectangle](https://rectangleapp.com/): `brew install rectangle`

---

# TODO
- A way to quickly see the suspended process of the terminal I'm in in tmux
