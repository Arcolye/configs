# Override the oh-my-zsh 'g' alias to run 'git s' when no arguments provided
unalias g
g() {
  if [[ $# -eq 0 ]]; then
    git s
  else
    git "$@"
  fi
}
