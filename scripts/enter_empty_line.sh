# Run git status or pwd when Enter is pressed on an empty line
_colored_pwd() {
  local path="$PWD"

  if [[ "$path" == "$HOME" ]]; then
    path="~"
  elif [[ "$path" == "$HOME/"* ]]; then
    path="~/${path#"$HOME/"}"
  fi

  if [[ "$path" == "/" ]]; then
    printf '\033[34m/\033[0m\n'
  elif [[ "$path" == */* ]]; then
    local parent="${path%/*}"
    local folder="${path##*/}"

    [[ -z "$parent" ]] && parent="/"
    if [[ "$parent" == "/" ]]; then
      printf '/\033[34m%s\033[0m\n' "$folder"
    else
      printf '%s/\033[34m%s\033[0m\n' "$parent" "$folder"
    fi
  else
    printf '\033[34m%s\033[0m\n' "$path"
  fi
}

_enter_empty_line() {
  if [[ -z "$BUFFER" ]]; then
    _colored_pwd
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      git status -s -b
    fi
  fi
  zle accept-line
}
zle -N _enter_empty_line
bindkey "^M" _enter_empty_line
