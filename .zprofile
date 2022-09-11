unset path
PATH="\
$HOME/.pyenv/bin:\
$HOME/.cargo/bin:\
$HOME/.emacs.d/bin:\
$HOME/.local/bin:"


# Append defaults
PATH+="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

eval "$(pyenv init --path)"
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -aU path
export PATH

export MANPATH=$(manpath)
