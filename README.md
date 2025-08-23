```
                                               _,--._.-,            
                                               /\_r-,\_ )           
                                            .-.) _;='_/ (.;         
                                             \ \'     \/' )         
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

## For Arch
1. config in [dotfiles-arch](https://github.com/LatentDream/dotfiles-arch)
2. stow config file with `./stow.sh stow-all`

## For MacOS
1. Install Justfile `brew install just` and `just install-all-mac`
2. Stow config file with `./stow.sh stow-all`

## For Ubuntu

1. Install Justfile `cargo install just` and `just install-all`
2. Stow config file with `./stow.sh stow-all`

## Notes
### Tmux
For tmux, open a tmux session and press `prefix` + `I` (capital i) to install the plugins.

### Windows - WSL Setup

1. Move `./windows/wsl-selector.ps1` to `~/` of your profile
2. Move `./alacritty/*` to `~/AppData/roaming/alacritty/*`
3. Un-comment the lauch of the `wsl-selector.ps1` script

## Screenshot

![demo](./demo.png)

## TODO:
- [ ] Add a git blame in nvim
