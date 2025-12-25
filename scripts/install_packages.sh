#!/usr/bin/env bash

set -euo pipefail

PACKAGES=(
	zsh
	neovim
	snapd
	stow
)

FLATPAK=(
	flathub
	md.obsidian.Obsidian
	com.bitwarden.desktop
	app.zen_browser.zen
)

SNAP=(
	youtube-music-desktop-app
)

sudo dnf install -y ${PACKAGES[@]}

sudo flatpak install ${FLATPAK[@]}

sudo snap install ${SNAP[@]}
