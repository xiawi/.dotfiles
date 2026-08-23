#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

if command -v ghostty &>/dev/null; then
	warning "Ghostty already installed. Skipping..."
	exit 0
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

