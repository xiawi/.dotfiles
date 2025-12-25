#!/usr/bin/env bash

set -euo pipefail

# Create these directories by default
DIRS=(
	dev
	notes
)

for dir in $DIRS; do
	target="$HOME/$dir"
	mkdir -p $target
done
