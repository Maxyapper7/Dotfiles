#!/bin/bash

# Install paru
yes | sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# Install rate-mirrors
paru -S --noconfirm rate-mirrors

# Find best mirrors
rate-mirrors --allow-root --protocol https arch | grep -v '^#' | sudo tee /etc/pacman.d/mirrorlist

# Enable Parallel Downloads

# Install normal Packages
sudo pacman -S -< pacman-pkg.txt

# Install AUR packages
paru -S --noconfirm -< aur-pkg.txt

# Hyprlink dotfiles Using Stow
stow alacritty flameshot picom tmux bottom polybar wallpapers dunst nvim rofi zsh dunst scripts i3 xresources
