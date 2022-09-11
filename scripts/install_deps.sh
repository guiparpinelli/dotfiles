#!/usr/bin/env bash
set -euo pipefail

DIR=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")
. "$DIR/base.sh"
. "$DIR/ansi"

export HOMEBREW_BUNDLE_FILE="$DIR/Brewfile"

if [[ "$OSTYPE" == "darwin"* ]]; then
	ansi --green "Using $HOMEBREW_BUNDLE_FILE bundle file"
	brew bundle
fi
