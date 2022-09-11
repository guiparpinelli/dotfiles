#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"
. "$DIR/ansi"

if ! isavailable go; then
	ansi --yellow "Go not installed. Skipping"
	exit 0
fi

ansi --green "Installing gitmux.."
go install github.com/arl/gitmux@latest

ansi --green "Installing gopls.."
GO111MODULE=on go install golang.org/x/tools/gopls@latest

ansi --green "Installing Chezmoi"
go install github.com/twpayne/chezmoi@latest

ansi --green "Installing gore..."
go install github.com/x-motemen/gore/cmd/gore@latest

ansi --green "Installing gocode..."
go install github.com/stamblerre/gocode@latest

ansi --green "Installing godoc..."
go install golang.org/x/tools/cmd/godoc@latest

ansi --green "Installing goimports..."
go install golang.org/x/tools/cmd/goimports@latest

ansi --green "Installing gorename..."
go install golang.org/x/tools/cmd/gorename@latest

ansi --green "Installing guru..."
go install golang.org/x/tools/cmd/guru@latest

ansi --green "Installing gotests..."
go install github.com/cweill/gotests/gotests@latest

ansi --green "Installing gomodifytags..."
go install github.com/fatih/gomodifytags@latest
