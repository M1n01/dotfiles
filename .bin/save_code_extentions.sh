#!/bin/sh

echo "Saving VSCode extensions..."
code-insiders --list-extensions > "$HOME"/dotfiles/vscode/code_extensions
