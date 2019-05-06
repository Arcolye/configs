export PS1="\[\033[38;5;22m\]\h\[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]\[\033[38;5;8m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
test -f ~/.git-completion.bash && . $_
alias g="git"
alias dex="docker-compose exec application"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
