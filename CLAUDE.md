# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for macOS. Manages shell (zsh), editor (vim, VSCode), and git configurations using symlink-based deployment.

## Setup Commands

```bash
# Install dotfiles (symlinks all dotfiles to $HOME, backs up existing ones to ~/.dotbackup)
./.bin/install.sh

# Set up VSCode settings (symlinks settings, keybindings, and snippets)
./.bin/setup_code.sh

# Save current VSCode extensions list
./.bin/save_code_extentions.sh
```

## Architecture

### Deployment Model

`install.sh` symlinks all `.*` files/directories from this repo into `$HOME`, skipping `.git`. Existing files are moved to `~/.dotbackup/`. It also sets `git config --global include.path "~/.gitconfig_shared"` to load shared git config.

### Whitelist .gitignore

The `.gitignore` uses an inverted pattern: it ignores everything (`/*`, `/.**`) then explicitly un-ignores tracked files with `!` prefixes. When adding a new dotfile, you must add a corresponding `!` entry to `.gitignore` or it won't be tracked.

### File Structure

- `.zshrc` / `.zshenv` — Shell config. `.zshrc` sources `~/.zshrc.local` for machine-specific settings and `.zsh/rc/alias.zsh` for aliases
- `.zsh/rc/alias.zsh` — All shell aliases (git, docker, terraform, etc.)
- `.gitconfig_shared` — Shared git config loaded via `include.path` (aliases, diff settings, push/fetch/merge preferences)
- `.vimrc` — Vim configuration
- `vscode/` — VSCode `settings.json`, `keybindings.json`, `snippets/`, and extension lists (`code_extensions`, `cursor_extensions.txt`)

### Multi-Account GitHub

The `ghautoswitch` function in `alias.zsh` switches `gh` auth between accounts based on the repo's `user.email` git config (`abe@smesh.jp` → `abe-smesh`, otherwise → `M1n01`).
