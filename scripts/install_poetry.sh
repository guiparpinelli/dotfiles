#!/usr/bin/env bash

curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"
poetry config virtualenvs.in_project true

if [ ! -d "$ZSH_CUSTOM" ]; then
	mkdir $ZSH_CUSTOM/plugins/poetry
	poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
fi
