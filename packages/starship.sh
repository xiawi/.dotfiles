#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

if command -v starship &>/dev/null; then
	warning "Starship already installed. Skipping..."
	exit 0
fi

curl -sS https://starship.rs/install.sh | sh

