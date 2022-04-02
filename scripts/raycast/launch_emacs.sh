#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 😈

# Documentation:
# @raycast.description Launch emacs client
# @raycast.author Guilherme Parpinelli
# @raycast.authorURL https://github.com/guiparpinelli

emacsclient --no-wait -c -a emacs "$@" >/dev/null 2>&1 &
