#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up macOS environment..."

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH for Apple Silicon Macs
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
else
  echo "Homebrew already installed"
fi

# Update Homebrew
brew update

# Install CLI tools
echo "Installing CLI tools..."
brew install \
  zsh \
  tmux \
  fzf \
  neovim \
  git \
  mise

# Install GUI apps
echo "Installing applications..."
brew install --cask \
  ghostty \
  visual-studio-code \
  raycast \
  karabiner-elements

# Install fonts
echo "Installing fonts..."
brew install --cask font-fira-code

# Install Oh My Zsh if not present
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed"
fi

# Link dotfiles
"$SCRIPT_DIR/link_dotfiles.sh"

# Link Karabiner config
mkdir -p "$HOME/.config/karabiner"
ln -sf "$SCRIPT_DIR/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
echo "Linked Karabiner config"

echo ""
echo "macOS setup complete!"
echo "Restart your terminal or run: source ~/.zshrc"
