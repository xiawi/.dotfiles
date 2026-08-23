#!/usr/bin/env bash

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -t 1 ]]; then
	RESET='\033[0m'

	BLACK='\033[30m'
	RED='\033[31m'
	GREEN='\033[32m'
	YELLOW='\033[33m'
	BLUE='\033[34m'
	MAGENTA='\033[35m'
	CYAN='\033[36m'
	WHITE='\033[37m'

	BOLD='\033[1m'
	DIM='\033[2m'
else
	RESET=''

	BLACK=''
	RED=''
	GREEN=''
	YELLOW=''
	BLUE=''
	MAGENTA=''
	CYAN=''
	WHITE=''

	BOLD=''
	DIM=''
fi
