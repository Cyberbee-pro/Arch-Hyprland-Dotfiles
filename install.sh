#!/bin/bash

# --- Cyberbee's Beast Mode Installer ---
DOTFILES_DIR="/data/programing/dotfiles"

echo "Initializing Cyberbee's Desktop"

# Function to create symlinks
link_config() {
    local src=$1
    local dest=$2
    
    # Check if a config already exists and back it up
    if [ -d "$dest" ] || [ -f "$dest" ]; then
        echo "Backing up existing config: $dest"
        mv "$dest" "${dest}.backup"
    fi

    echo "Linking $src -> $dest"
    ln -s "$src" "$dest"
}

# 1. Link .config folders
mkdir -p ~/.config
link_config "$DOTFILES_DIR/.config/hypr" ~/.config/hypr
link_config "$DOTFILES_DIR/.config/waybar" ~/.config/waybar
link_config "$DOTFILES_DIR/.config/kitty" ~/.config/kitty

# 2. Link Shell configs
link_config "$DOTFILES_DIR/.zshrc" ~/.zshrc

echo "Installation Complete! Restart Hyprland to see the magic."
