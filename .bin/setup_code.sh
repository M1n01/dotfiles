#!/bin/sh

echo "Setting up VSCode..."

function setup_vscode_dotfiles() {
  local user_dir="$HOME/Library/Application Support/Code/User"
  mkdir -p "$user_dir/snippets"

  ln -sf "$HOME/dotfiles/vscode/keybindings.json" "$user_dir/keybindings.json"
  ln -sf "$HOME/dotfiles/vscode/settings.json" "$user_dir/settings.json"

  for f in "$HOME/dotfiles/vscode/snippets/"*.json; do
    ln -sf "$f" "$user_dir/snippets/$(basename "$f")"
  done
}

setup_vscode_dotfiles
