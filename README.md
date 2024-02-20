# Installation

```bash
sudo pacman -Suy --needed git stow neovim mako wofi hypland hyprpaper fish starship foot swaylock waybar
git clone https://github.com/simidzu2ay/dotfiles.git
cd dotfiles
stow .
```

### For propper spotify window and telegram malloc
```bash
yay -S spotifywm-git jemalloc
```

> [!WARNING]  
> `swaylock` and `hyprpaper` are using Pictures inside ~/Pictures/Wallpaper which is NOT specified in this repository
