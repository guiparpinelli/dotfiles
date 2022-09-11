#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"

EMACS_PATH="$HOME/.emacs.d"
if [ ! -f "$EMACS_PATH/bin/doom" ]; then
	mkdir -p "$EMACS_PATH"
	git clone --depth 1 https://github.com/hlissner/doom-emacs "$EMACS_PATH"
	"$EMACS_PATH/bin/doom" -y install
else
	"$EMACS_PATH/bin/doom" -y sync -e
fi
