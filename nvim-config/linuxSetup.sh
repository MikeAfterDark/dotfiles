#!/bin/bash

# Define paths
CONFIG_DIR="$HOME/.config"
NVIM_CONFIG="$CONFIG_DIR/nvim"
BACKUP_DIR="$CONFIG_DIR/nvim_backup"
NEW_CONFIG="$HOME/Coding/dotfiles/nvim-config"

echo "Setting up Neovim configuration..."

# Ensure ~/.config exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating ~/.config directory..."
    mkdir -p "$CONFIG_DIR"
fi

# Backup existing config if it exists
if [ -d "$NVIM_CONFIG" ]; then
    # Ensure backup directory exists
    if [ ! -d "$BACKUP_DIR" ]; then
        mkdir -p "$BACKUP_DIR"
    fi

    TIMESTAMP=$(date +%Y%m%d%H%M%S)
    BACKUP_PATH="${BACKUP_DIR}/nvim_${TIMESTAMP}"
    
    echo "Backing up existing Neovim config to $BACKUP_PATH..."
    mv "$NVIM_CONFIG" "$BACKUP_PATH"
fi

# Create symbolic link
echo "Creating symbolic link..."
ln -s "$NEW_CONFIG" "$NVIM_CONFIG"

echo "Setup complete!"
