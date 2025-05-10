#!/bin/bash

# Set installation path
INSTALL_PATH="$HOME/.local/bin"
GODOT_BIN="$INSTALL_PATH/godot"

# Ensure ~/.local/bin is in PATH
export PATH="$INSTALL_PATH:$PATH"

# If a version is provided, download and install that version
if [ -n "$1" ]; then
    VERSION="$1"
    ZIP_NAME="Godot_v${VERSION}-stable_mono_linux_x86_64.zip"
    DOWNLOAD_URL="https://github.com/godotengine/godot/releases/download/${VERSION}-stable/${ZIP_NAME}"

    echo "Downloading Godot $VERSION..."
    wget -q --show-progress "$DOWNLOAD_URL" || {
        echo "Failed to download version $VERSION"
        exit 1
    }

    echo "Unzipping..."
    unzip -o "$ZIP_NAME" || {
        echo "Failed to unzip $ZIP_NAME"
        exit 1
    }

    echo "Installing to $GODOT_BIN..."
    EXTRACTED_DIR="Godot_v${VERSION}-stable_mono_linux_x86_64"

    mv -f "$EXTRACTED_DIR/GodotSharp" "$INSTALL_PATH/"
    mv -f "$EXTRACTED_DIR/Godot_v${VERSION}-stable_mono_linux.x86_64" "$GODOT_BIN"
    chmod +x "$GODOT_BIN"

    rm -rf "$EXTRACTED_DIR"
    rm -f "$ZIP_NAME"

    # Add desktop shortcut
    cp godot.desktop ~/.local/share/applications/godot.desktop
    chmod +x ~/.local/share/applications/godot.desktop
fi

if [ "$2" != "silent" ]; then
    if [ -x "$GODOT_BIN" ]; then
        "$GODOT_BIN"
    else
        echo "Godot is not installed. Please run with a version number first, e.g.:"
        echo "./godot.sh 4.4.1"
        exit 1
    fi
fi
