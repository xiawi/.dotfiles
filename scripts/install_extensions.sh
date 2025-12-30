#!/usr/bin/env bash

EXTENSIONS=(
	gnome-shell-extension-auto-move-windows
)

sudo dnf install -y ${EXTENSIONS[@]}
