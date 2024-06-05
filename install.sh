#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symlinks for each dotfile
ln -s "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
ln -s "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
ln -s "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"
# Add more symlinks for other dotfiles as needed

echo "Dotfiles installed successfully!"
