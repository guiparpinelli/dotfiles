unset path
PATH="\
$HOME/.asdf/shims:\
$HOME/.asdf/bin:\
$HOME/.pyenv/bin:\
$HOME/.cargo/bin:\
$HOME/.emacs.d/bin:\
$HOME/.local/bin:\
$HOME/Library/Python/3.9/bin:"

# Append defaults
PATH+="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

eval "$(pyenv init --path)"
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -aU path
export PATH

export MANPATH=$(manpath)
