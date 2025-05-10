#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPORT_LINE="export PATH=\"$SCRIPT_DIR:\$PATH\""

if ! grep -Fxq "$EXPORT_LINE" "$HOME/.bashrc"; then
    echo "" >>"$HOME/.bashrc"
    echo "# Added by dotfiles/bin/setup.sh on $(date)" >>"$HOME/.bashrc"
    echo "$EXPORT_LINE" >>"$HOME/.bashrc"
    echo "Added $SCRIPT_DIR to PATH in ~/.bashrc"
    echo "don't forget to 'source $HOME/.bashrc'"
else
    echo "$SCRIPT_DIR is already in PATH in ~/.bashrc"
fi
