# WSL Ubuntu `u` updater

A short Zsh command to update Ubuntu packages in WSL.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/priyanshuchawda/wsl-ubuntu-u-update/main/install.sh | bash
source ~/.zshrc
```

## Use

```zsh
u
```

The command refreshes APT package lists, upgrades installed Ubuntu packages, removes unused packages, and cleans the APT cache. It stops if a required APT step fails. It only updates Ubuntu packages; it does not update Snap packages, language toolchains, Docker Desktop, Windows applications, firmware, or the WSL kernel.

## Zsh developer setup

Install Zsh, inline history suggestions, syntax highlighting, fuzzy search, and directory navigation with:

```bash
sudo apt-get install zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide
```

Use [zshrc.example](zshrc.example) as a starting point. Make Zsh the permanent login shell with `chsh -s "$(command -v zsh)"`, then open a new WSL terminal.
