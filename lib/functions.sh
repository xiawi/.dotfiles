#!/usr/bin/env bash

source "$(dirname -- "${BASH_SOURCE[0]}")/constants.sh"

contains() {
	local needle="$1"
	shift

	local item

	for item in "$@"; do
		if [[ "$item" == "$needle" ]]; then
			return 0
		fi
	done

	return 1
}

info() {
	printf '%b\n' "${CYAN}$*${RESET}"
}

success() {
	printf '%b\n' "${GREEN}$*${RESET}"
}

warning() {
	printf '%b\n' "${YELLOW}$*${RESET}"
}

error() {
	printf '%b\n' "${RED}$*${RESET}" >&2
	exit 1
}

