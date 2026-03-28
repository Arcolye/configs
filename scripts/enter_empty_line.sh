# Run git status or pwd when Enter is pressed on an empty line
_enter_empty_line() {
  if [[ -z "$BUFFER" ]]; then
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      BUFFER="git ss"
    else
      BUFFER="pwd"
    fi
  fi
  zle accept-line
}
zle -N _enter_empty_line
bindkey "^M" _enter_empty_line
