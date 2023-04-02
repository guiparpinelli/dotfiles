#
# @parpi zsh config
#

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="vim"                               # $EDITOR use Vim in terminal
export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd docker zsh-autosuggestions zsh-syntax-highlighting poetry)

source $ZSH/oh-my-zsh.sh

### Aliases ###

# Emacs
alias em="/opt/homebrew/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias killemacs="emacsclient -e '(kill-emacs)' && brew services restart d12frosted/emacs-plus/emacs-plus@28"

# Changing "ls" to "exa"
alias la='exa -al --color=always --group-directories-first' # my preferred listing
alias ls='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always'                            # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# yt-dlp
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

# Configs
alias zshcfg="vim ~/.zshrc"
alias zprof="vim ~/.zprofile"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias gitcfg="vim ~/.gitconfig"
alias dotfiles="cd ~/dotfiles"
alias pshell="poetry shell"

# IPython
alias ipy="ipython"

# Misc
alias c="clear"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

weather () {
  curl "https://wttr.in/${1}"
}

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
