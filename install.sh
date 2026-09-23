#!/usr/bin/env bash
set -euo pipefail

install_dir="$HOME/.local/bin"
script_path="$install_dir/u-update"
mkdir -p "$install_dir"
curl -fsSL https://raw.githubusercontent.com/priyanshuchawda/wsl-ubuntu-u-update/main/u-update.sh -o "$script_path"
chmod +x "$script_path"

rc="$HOME/.zshrc"
touch "$rc"
if ! grep -Fq 'alias u="$HOME/.local/bin/u-update"' "$rc"; then
    printf '\n# Ubuntu package updater shortcut\nalias u="$HOME/.local/bin/u-update"\n' >> "$rc"
fi
printf 'Installed. Run `source ~/.zshrc`, then type `u`.\n'
