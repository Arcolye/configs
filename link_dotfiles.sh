#!/bin/bash

# Get the directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"
ZSHRC="$HOME/.zshrc"

ZSHRC_SOURCE_BLOCK="
# Load personal zsh config from configs repo
if [ -f \"$DOTFILES_DIR/zshrc\" ]; then
  source \"$DOTFILES_DIR/zshrc\"
fi"

# Create ~/.zshrc as a local entrypoint instead of linking it to the repo.
if [ -L "$ZSHRC" ]; then
  rm "$ZSHRC"
fi

touch "$ZSHRC"

if ! grep -Fq "source \"$DOTFILES_DIR/zshrc\"" "$ZSHRC"; then
  printf "%s\n" "$ZSHRC_SOURCE_BLOCK" >> "$ZSHRC"
fi

# Create symlinks
ln -sf "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/sahv.zsh-theme" ~/.oh-my-zsh/themes/sahv.zsh-theme

if [ -d "/Applications/Karabiner-Elements.app" ] || [ -d "$HOME/Applications/Karabiner-Elements.app" ]; then
  mkdir -p "$HOME/.config/karabiner"
  ln -sf "$SCRIPT_DIR/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
  echo "Linked Karabiner config"
fi

echo "Dotfiles linked from $DOTFILES_DIR"
echo "~/.zshrc loads $DOTFILES_DIR/zshrc"
