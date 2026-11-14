# Tools

Tools used to improve workflow. Installs preferred software and applies personal configs for dev work on Debian-based Linux systems.

## What gets installed

**Packages** (via apt):
- `neovim` (latest stable AppImage)
- `python3`, `python3-venv`, `python3-neovim`
- `npm`, `clang`
- `tmux`, `git`, `ripgrep`, `jq`
- `brightnessctl`, `autorandr`, `fuse`

**Configs applied:**
- Neovim config → `~/.config/nvim/`
- i3 window manager config → `~/.config/i3/config`
- `.bashrc` → `~/`
- `.tmux.conf` → `~/` (plugins via tpm, cloned by the script)
- `.vimrc` → `~/`
- `lightmode` / `darkmode` → `~/bin/` (WSL only)

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

## lightmode / darkmode

WSL helper scripts that switch Windows Terminal ("One Half Light"/"One Half Dark" and the tab bar theme), nvim and tmux between light and dark; nvim `<leader>tt` calls them. They update the default and any profile that overrides `colorScheme`, and keep a `settings.json.bak` backup. Requires `jq`.

```bash
lightmode
darkmode
```

## Manual / reference files

- `windows-terminal/settings.json` — Windows Terminal settings (fonts, keybindings, color schemes). Copy into Terminal's `LocalState` folder on Windows.
- `wsl/wsl.conf` — WSL settings (systemd on, `appendWindowsPath=false`). Copy to `/etc/wsl.conf`, add a `[user] default=<name>` section, then run `wsl --shutdown`. With `appendWindowsPath=false`, `.bashrc` adds the needed Windows dirs to `PATH`.

## Other files

- `takeMeToTerminal.ahk` — AutoHotKey script (Windows) to bind a key to open a terminal
- `init.lua.updated` — alternate Neovim init config
