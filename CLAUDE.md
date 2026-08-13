# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for macOS. Manages shell (zsh), editor (vim), and git configurations using symlink-based deployment.

## Setup Commands

```bash
# Install dotfiles (symlinks all dotfiles to $HOME, backs up existing ones to ~/.dotbackup)
./.bin/install.sh
```

## Architecture

### Deployment Model

`install.sh` symlinks all `.*` files/directories from this repo into `$HOME`, skipping `.git`. Existing files are moved to `~/.dotbackup/`. It also sets `git config --global include.path "~/.gitconfig_shared"` to load shared git config.

For nested directories (`.claude`, `.agents`), individual files are symlinked via `link_nested_dir()`. After that, `distribute_skills()` symlinks each skill directory from `~/.agents/skills/` into `~/.claude/skills/`, `~/.codex/skills/`, and `~/.cursor/skills/` so all agents share a single source of skills. Finally, `sync-agent-instructions.sh` combines shared and Codex-specific instructions into `~/.codex/AGENTS.md`.

### Whitelist .gitignore

The `.gitignore` uses an inverted pattern: it ignores everything (`/*`, `/.**`) then explicitly un-ignores tracked files with `!` prefixes. When adding a new dotfile, you must add a corresponding `!` entry to `.gitignore` or it won't be tracked.

### File Structure

- `.zshrc` / `.zshenv` — Shell config. `.zshrc` sources functions, prompt, machine-local settings, and aliases
- `.zsh/rc/functions.zsh` — Shell functions for terminal helpers and account-aware CLI wrappers
- `.zsh/rc/prompt.zsh` — Shell prompt with directory-aware Git and GitHub account display
- `.zsh/rc/alias.zsh` — All shell aliases (git, docker, terraform, etc.)
- `.gitconfig_shared` — Shared git config loaded via `include.path` (aliases, diff settings, push/fetch/merge preferences)
- `.vimrc` — Vim configuration
- `.agents/skills/` — Single source for all agent skills. Distributed to `.claude/`, `.codex/`, `.cursor/` via `install.sh`
- `.agents/common.md` — Shared global instructions for coding agents
- `.agents/codex.md` / `.agents/claude.md` — Tool-specific global instructions
- `.bin/sync-agent-instructions.sh` — Generates `~/.codex/AGENTS.md` from the shared and Codex-specific sources
- `cursor/` — Cursor extension list (`cursor_extensions.txt`)

### Multi-Account GitHub

The `gh` wrapper in `functions.zsh` selects an isolated `GH_CONFIG_DIR` based on the current directory (`~/dev/company/smesh` → `~/.config/gh-smesh`, otherwise → `~/.config/gh`). Git identity is selected separately through `.gitconfig`'s conditional include.
