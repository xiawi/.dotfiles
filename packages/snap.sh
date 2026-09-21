#!/usr/bin/env bash

set -euo pipefail

# set hidden directory for snap
sudo snap set system experimental.hidden-snap-folder=true

# reinstall applications
for snap in $(snap list | awk 'NR>1 {print $1}'); do
    # Skip core system snaps that cannot or shouldn't be purged
    if [[ "$snap" =~ ^(snapd|core[0-9]+|bare|gtk-common-themes|gnome-[0-9]+-[0-9]+|mesa-[0-9]+)$ ]]; then
        continue
    fi
    echo "Reinstalling $snap..."
    sudo snap remove "$snap" --purge && sudo snap install "$snap"
done

