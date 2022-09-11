#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"
. "$DIR/ansi"

if [[ "$OSTYPE" == "darwin"* ]]; then
	SYNCMAIL_PLIST="$HOME/Library/LaunchAgents/com.syncmail.plist"
	if [ -f "$SYNCMAIL_PLIST" ]; then
		ansi --green "Loading syncmail.plist..."
		(launchctl list | grep --silent syncmail) && launchctl unload "$SYNCMAIL_PLIST"
		launchctl load -w "$SYNCMAIL_PLIST"
	else
		ansi --yellow "Skipping launchctl of syncmail.plist"
	fi
fi
