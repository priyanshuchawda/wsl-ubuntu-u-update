#!/usr/bin/env bash
# Update Ubuntu in WSL and common user-level developer tools.

set -uo pipefail

failed=0
step() {
    local title=$1
    shift
    printf '\n==> %s\n' "$title"
    if "$@"; then
        :
    else
        printf 'Warning: %s failed (continuing)\n' "$title" >&2
        failed=1
    fi
}

printf '%s\n' 'Updating Ubuntu packages and installed developer tools…'

# A fresh package index is required before upgrading.
printf '\n==> Ubuntu package index\n'
sudo apt-get update || exit $?
step 'Upgrade Ubuntu packages' sudo apt-get dist-upgrade -y
step 'Remove unused Ubuntu packages' sudo apt-get autoremove --purge -y
step 'Clean apt package cache' sudo apt-get clean

if command -v snap >/dev/null 2>&1; then
    step 'Snap packages' sudo snap refresh
fi
if command -v rustup >/dev/null 2>&1; then
    step 'Rust toolchains (rustup)' rustup update
fi
if command -v npm >/dev/null 2>&1; then
    step 'Global npm packages' npm update -g
fi
if command -v pnpm >/dev/null 2>&1; then
    step 'Global pnpm packages' pnpm update -g
fi
if command -v bun >/dev/null 2>&1; then
    step 'Bun runtime' bun upgrade
fi
if command -v uv >/dev/null 2>&1; then
    step 'uv runtime' uv self update
    step 'uv tools' uv tool upgrade --all
fi
if command -v pipx >/dev/null 2>&1; then
    step 'pipx tools' pipx upgrade-all
fi
if command -v flutter >/dev/null 2>&1; then
    step 'Flutter SDK' flutter upgrade
fi

printf '\n%s\n' 'Docker engine is managed by Docker Desktop in WSL; Docker images are not updated here.'
printf '%s\n' 'Update check complete.'
printf '%s\n' 'Restart WSL if needed with `wsl --shutdown` from Windows.'
exit "$failed"
