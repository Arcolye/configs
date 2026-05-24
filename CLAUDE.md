# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles and dev environment configuration repo. Manages shell, git, tmux, and keyboard configs across macOS and Linux.

## Setup Commands

```bash
# macOS full setup
./install_mac.sh

# Ubuntu/Debian full setup
./install_apt.sh

# Link dotfiles only (idempotent)
./link_dotfiles.sh

# Reload shell after changes
source ~/.zshrc
```

## Architecture

- **`dotfiles/`** — Shell, git, and tmux configs installed by `link_dotfiles.sh`
- **`scripts/`** — Helper scripts auto-sourced by zshrc (glob `~/.configs/scripts/*.sh`)
- **`install_mac.sh` / `install_apt.sh`** — Platform-specific installers (Homebrew on mac, apt on Debian); both call `link_dotfiles.sh`
- **`karabiner.json`** — macOS keyboard remapping (caps→ctrl/esc, command tap overrides)

Most dotfiles are managed via symlinks, not copies. `link_dotfiles.sh` creates:
- `~/.zshrc` as a local entrypoint that sources `dotfiles/zshrc`
- `~/.tmux.conf` → `dotfiles/tmux.conf`
- `~/.gitconfig` → `dotfiles/gitconfig`
- `~/.oh-my-zsh/themes/sahv.zsh-theme` → `dotfiles/sahv.zsh-theme`

## Tool Stack

Zsh (Oh My Zsh), tmux, mise (version manager), fzf, neovim, VSCode. Git aliases use fzf for interactive branch selection (`g sw`, `g amend`).

## Conventions

- Install scripts use `set -e` for fail-fast behavior
- New shell helpers go in `scripts/` as `<name>.sh` files (auto-sourced)
- Platform differences are handled by separate install scripts, not conditionals
