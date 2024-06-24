#!/bin/bash

# Install paru
yes | sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
yes | makepkg -si

rm -rf paru

# Install rate-mirrors
paru -S --noconfirm rate-mirrors

# Find best mirrors
rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist

# Enable Parallel Downloads
echo "[options]" | sudo tee -a /etc/pacman.conf
echo "ParallelDownloads = 5" | sudo tee -a /etc/pacman.conf

# Install normal Packages
sudo pacman -S --noconfirm -< pacman-pkg.txt

# Install AUR packages
paru -S --noconfirm -< aur-pkg.txt

# Install Twingate
curl -s https://binaries.twingate.com/client/linux/install.sh | sudo bash

# Hyprlink dotfiles Using Stow
stow alacritty flameshot picom tmux bottom polybar wallpapers dunst nvim rofi zsh dunst scripts i3 xresources

# Hyprlink Cursor Theme
stow -t /usr/share/icons/default cursor

# Set firefox as deafault browser
xdg-settings check default-web-browser firefox.desktop
