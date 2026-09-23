#!/usr/bin/env bash
set -euo pipefail

install_dir="$HOME/.local/bin"
script_path="$install_dir/u-update"
mkdir -p "$install_dir"
curl -fsSL https://raw.githubusercontent.com/priyanshuchawda/wsl-ubuntu-u-update/main/u-update.sh -o "$script_path"
chmod +x "$script_path"

bashrc="$HOME/.bashrc"
if ! grep -Fq 'alias u="~/.local/bin/u-update"' "$bashrc"; then
    printf '\n# WSL Ubuntu updater shortcut\nalias u="~/.local/bin/u-update"\n' >> "$bashrc"
fi
printf 'Installed. Run `source ~/.bashrc`, then type `u`.\n'
