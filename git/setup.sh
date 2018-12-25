#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

#
# Functions:
#

function echo_info() {
	echo "[dotfiles/git] INFO setup.sh - $1" >&1
}

function echo_error() {
	echo "[dotfiles/git] ERROR setup.sh - $1" >&1
}

#
# Constants:
#

DIR="$(cd "$(dirname "$0")"; pwd -P)"
FILES=(
	"${DIR}/.gitconfig"
	"${DIR}/.gitignore_global"
	)

# 1. Copy Files
for file in "${FILES[@]}"; do
	echo_info "Copying file ${file}"
	cp -R "${file}" "${HOME}"
done
