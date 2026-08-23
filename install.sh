#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/lib/constants.sh"
source "$DOTFILES/lib/components.sh"
source "$DOTFILES/lib/functions.sh"

ONLY=()
SKIP=()

usage() {
	cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --only COMPONENT...    Configure only the specified components
  --skip COMPONENT...    Skip the specified components
  --list                 List available components
  -h, --help             Show this help message

Examples:
  $0
  $0 --only nvim
  $0 --only bash git
  $0 --skip ghostty
  $0 --only ghostty starship --skip ghostty
EOF
}

list_components() {
	echo "Available configuration components:"
	echo

	for component in "${!INSTALL[@]}"; do
		echo "  $component"
	done
}

while [[ $# -gt 0 ]]; do
	case "$1" in
		--only)
			shift

			[[ $# -gt 0 ]] ||
				error "--only requires at least one component"

			while [[ $# -gt 0 && "$1" != -* ]]; do
				[[ -v "INSTALL[$1]" ]] ||
					error "unknown configuration component: $1"

				ONLY+=("$1")
				shift
			done
			;;

		--skip)
			shift

			[[ $# -gt 0 ]] ||
				error "--skip requires at least one component"

			while [[ $# -gt 0 && "$1" != -* ]]; do
				[[ -v "INSTALL[$1]" ]] ||
					error "unknown configuration component: $1"

				SKIP+=("$1")
				shift
			done
			;;

		--list)
			list_components
			exit 0
			;;

		-h|--help)
			usage
			exit 0
			;;

		*)
			error "unknown option: $1"
			;;
	esac
done

for component in "${!INSTALL[@]}"; do
	if ((${#ONLY[@]} > 0)) && ! contains "$component" "${ONLY[@]}"; then
		continue
	fi

	if contains "$component" "${SKIP[@]}"; then
		continue
	fi
	info "Setting up $component..."
	"${INSTALL[$component]}"
	success "Done setting up $component!"
done

success "Installation complete."

