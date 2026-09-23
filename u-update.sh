#!/usr/bin/env bash
# Refresh and upgrade Ubuntu packages, then remove obsolete packages.
set -Eeuo pipefail

printf '%s\n' 'Updating Ubuntu packages…'
printf '\n%s\n' '==> Refresh package lists'
sudo apt-get update
printf '\n%s\n' '==> Upgrade installed packages'
sudo apt-get dist-upgrade --assume-yes
printf '\n%s\n' '==> Remove unused packages'
sudo apt-get autoremove --purge --assume-yes
printf '\n%s\n' '==> Clean package cache'
sudo apt-get clean
printf '\n%s\n' 'Ubuntu update complete.'
