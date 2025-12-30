#!/usr/bin/env bash

MARKER="$HOME/.dotfiles/.gnome-restart-required"

[[ -f "$MARKER" ]] || exit 0

bash $HOME/.dotfiles/scripts/after/auto-move-windows.sh

# Cleanup
rm -f "$MARKER"
rm -f "$HOME/.config/autostart/post-gnome-setup.desktop"
