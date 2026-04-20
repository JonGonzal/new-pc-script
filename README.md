# Tools

Tools used to improve workflow. Installs preferred software and applies personal configs for dev work on Debian-based Linux systems.

## What gets installed

**Packages** (via apt):
- `neovim` (latest stable AppImage)
- `python3`, `python3-venv`, `python3-neovim`
- `npm`, `clang`
- `tmux`, `git`, `ripgrep`
- `brightnessctl`, `autorandr`, `fuse`

**Configs applied:**
- Neovim config → `~/.config/nvim/`
- i3 window manager config → `~/.config/i3/config`
- `.bashrc` → `~/`
- `.tmux.conf` → `~/`

## Installation

> **Requirements:** Debian/Ubuntu-based Linux, `sudo` access, `wget`

1. Clone this repo:
   ```bash
   git clone <repo-url>
   cd new-pc-script
   ```

2. Make the script executable and run it:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
3. For 'folke/which-key.nvim' to work in WSL2, you will need to install `JetBrainsMono Nerd Font` from [Nerdfonts]("https://www.nerdfonts.com/font-downloads").

The script will update apt, install packages, download the latest Neovim stable release, and copy all config files to their target locations.

## Other files

- `takeMeToTerminal.ahk` — AutoHotKey script (Windows) to bind a key to open a terminal
- `init.lua.updated` — alternate Neovim init config
