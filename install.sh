#!/usr/bin/env bash

set -euo pipefail

./scripts/install_packages.sh
./scripts/move_to_misc.sh
./scripts/set_defaults.sh
./scripts/new_home.sh
./scripts/set_shortcuts.sh
./scripts/install_extensions.sh

source packages.sh

for pac in ${PACKAGES[@]}; do
	stow -D $pac
	echo "Stowing $pac"
	stow $pac
done

# GNOME restart required marker
MARKER=".gnome-restart-required"
touch "$MARKER"

# Autostart hook
AUTOSTART="$HOME/.config/autostart"
mkdir -p "$AUTOSTART"

cat > "$AUTOSTART/post-gnome-setup.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Post GNOME Setup
Exec=$HOME/.dotfiles/scripts/after.sh
X-GNOME-Autostart-enabled=true
X-GNOME-Autostart-Delay=3
NoDisplay=true
EOF

echo "⚠ GNOME restart required. Please log out and log back in."
