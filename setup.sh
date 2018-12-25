#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#
# Functions:
#

function echo_info() {
	echo "[dotfiles] INFO setup.sh - $1" >&1
}

function echo_error() {
	echo "[dotfiles] ERROR setup.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"
FILES=(
	"${DIR}/.tmux.conf"
	)
SCRIPTS=(
	"${DIR}/brew/setup.sh"
	"${DIR}/git/setup.sh"
	"${DIR}/zsh/setup.sh"
	"${DIR}/macos/setup.sh"
	)

# 1. Copy Files
for file in "${FILES[@]}"; do
	echo_info "Copying file ${file}"
	cp -R "${file}" "${HOME}"
done

# 2. Source Scripts
for script in "${SCRIPTS[@]}"; do
	echo_info "Sourcing script ${script}"
	source "${script}"
done
