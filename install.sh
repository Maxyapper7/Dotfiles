#!/bin/bash

# Install Paru
yes | sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install AUR packages
paru -S -< aur-pkg.txt

# Find best mirrors
rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist

# Enable Parallel Downloads

# Install normal Packages
sudo pacman -S -< pacman-pkg.txt

# Hyprlink dotfiles Using Stow
stow -p ~ 
