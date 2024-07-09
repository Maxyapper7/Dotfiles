#!/bin/bash

# Install paru
sudo pacman -S --noconfirm --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
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
stow alacritty flameshot picom tmux ulauncher bottom polybar wallpapers dunst nvim zsh dunst scripts i3 xresources

# Hyprlink Cursor Theme
sudo rm -rf /usr/share/icons/default/index.theme
sudo stow -t /usr/share/icons/default cursor

# Start SDDM on startup
sudo systemctl enable sddm

# Start Libvirtd Service
sudo systemctl enable libvirtd.service

# Add to Libvirt group
sudo usermod -a -G libvirt $(whoami)

# Set firefox as deafault browser
xdg-settings check default-web-browser firefox.desktop

# Install OMZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
