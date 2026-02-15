#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up Ubuntu/Debian environment..."

# Update package list
sudo apt update

# Install CLI tools
echo "Installing CLI tools..."
sudo apt install -y \
  zsh \
  tmux \
  fzf \
  neovim

# Install mise if not present
if ! command -v mise &>/dev/null; then
  echo "Installing mise..."
  curl https://mise.run | sh
  export PATH="$HOME/.local/bin:$PATH"
else
  echo "mise already installed"
fi

# Install Oh My Zsh if not present
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed"
fi

# Link dotfiles
"$SCRIPT_DIR/link_dotfiles.sh"

# Set zsh as default shell
if [[ "$SHELL" != *"zsh"* ]]; then
  echo "Setting zsh as default shell..."
  chsh -s $(which zsh)
fi

echo ""
echo "Ubuntu/Debian setup complete!"
echo "Restart your terminal or run: source ~/.zshrc"
