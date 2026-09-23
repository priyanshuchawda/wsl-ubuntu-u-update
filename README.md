# WSL Ubuntu `u` updater

A small Bash updater for Ubuntu running under WSL. It upgrades Ubuntu packages and, when installed, common developer tools. Run it with one letter: `u`.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/priyanshuchawda/wsl-ubuntu-u-update/main/install.sh | bash
```

Open a new Bash shell (or run `source ~/.bashrc`) after installation.

## Use

```bash
u
```

The updater uses `sudo` for Ubuntu and Snap packages. It runs `apt-get update`, `apt-get dist-upgrade`, removes unused packages, cleans the apt cache, and updates installed Snap, Rust, global npm/pnpm, Bun, uv tools, pipx tools, and Flutter. Tool failures are reported and the updater continues; an apt index refresh failure stops the update.

Docker Desktop manages the Docker engine in WSL, so this updater does not prune images or update the engine. Firmware and Linux kernel reboot checks are also omitted because those are managed by Windows/WSL.

## Install manually

```bash
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/priyanshuchawda/wsl-ubuntu-u-update/main/u-update.sh -o ~/.local/bin/u-update
chmod +x ~/.local/bin/u-update
printf '\n# WSL Ubuntu updater shortcut\nalias u="~/.local/bin/u-update"\n' >> ~/.bashrc
source ~/.bashrc
```

## Uninstall

Remove the `alias u=...` line added to `~/.bashrc`, then delete `~/.local/bin/u-update`.
