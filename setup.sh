# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Fira Code Font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

brew install --cask firefox

cp ./.gitconfig ~
