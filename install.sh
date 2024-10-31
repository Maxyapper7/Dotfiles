#!/bin/sh

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
# I have been having some problem with this
#rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist

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
stow . 

# Start SDDM on startup
sudo systemctl enable sddm

# Start Libvirtd Service
sudo systemctl enable libvirtd.service

# Add to Libvirt group
sudo usermod -a -G libvirt $(whoami)

# Set firefox as deafault browser
xdg-settings set default-web-browser firefox.desktop

# Twingate fix
chown root:root /etc/twingate

# Set gesttings cursors
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# Git editor 
git config --global core.editor "nvim"
