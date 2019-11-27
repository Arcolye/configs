# Custom prompt from http://ezprompt.net/
export PS1="\[\033[38;5;22m\]\h\[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;33m\]\W\[$(tput sgr0)\]\[\033[38;5;8m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Git Completion
test -f ~/.git-completion.bash && . $_

alias g="git"
alias ∂="docker-compose exec application"
alias ®="∂ bin/rspec"
alias ç="∂ rails c"

# brew install rbenv, then:
eval "$(rbenv init -)"
