#!/usr/bin/env bash

set -euo pipefail

source "$(dirname -- "${BASH_SOURCE[0]}")/lib/constants.sh"
source "$DOTFILES/lib/functions.sh"
source "$DOTFILES/lib/components.sh"

ONLY=()
SKIP=()

usage() {
	cat <<EOF
Usage: $0 [OPTIONS]

Options:
  --only COMPONENT...    Bootstrap only the specified components
  --skip COMPONENT...    Skip the specified components
  --list                 List available components
  -h, --help             Show this help message

Examples:
  $0
  $0 --only neovim
  $0 --only neovim ghostty
  $0 --skip spacemono
  $0 --only neovim ghostty --skip ghostty
EOF
}

list_components() {
	echo "Available bootstrap components:"
	echo

	for component in "${!BOOTSTRAP[@]}"; do
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
				[[ -v "BOOTSTRAP[$1]" ]] ||
					error "unknown bootstrap component: $1"

				ONLY+=("$1")
				shift
			done
			;;

		--skip)
			shift

			[[ $# -gt 0 ]] ||
				error "--skip requires at least one component"

			while [[ $# -gt 0 && "$1" != -* ]]; do
				[[ -v "BOOTSTRAP[$1]" ]] ||
					error "unknown bootstrap component: $1"

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

for component in "${!BOOTSTRAP[@]}"; do
	if ((${#ONLY[@]} > 0)) && ! contains "$component" "${ONLY[@]}"; then
		continue
	fi

	if contains "$component" "${SKIP[@]}"; then
		continue
	fi

	info "Bootstrapping $component..."
	"${BOOTSTRAP[$component]}"
	success "Done bootstrapping $component!"
done

success "Bootstrap complete."
