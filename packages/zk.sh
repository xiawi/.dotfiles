#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/../lib/functions.sh"

# dependencies
sudo apt update
sudo apt install -y golang-go

if command -v zk &>/dev/null; then
	warning "Zk already installed. Skipping..."
	exit 0
fi

# clone, build, and install zk
rm -rf /tmp/zk

git clone https://github.com/zk-org/zk.git /tmp/zk

cd /tmp/zk

make build

sudo install -Dm755 zk /usr/local/bin/zk

