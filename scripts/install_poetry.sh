#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"
. "$DIR/ansi"

if ! isavailable python3; then
	ansi --yellow "Python 3 not installed. Skipping"
	exit 0
fi

curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"
poetry config virtualenvs.in_project true


if [ ! -d "$ZSH_CUSTOM" ]; then
	mkdir "$ZSH_CUSTOM/plugins/poetry"
	poetry completions zsh > "$ZSH_CUSTOM/plugins/poetry/_poetry"
fi
