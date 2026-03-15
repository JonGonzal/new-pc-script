#! /bin/bash

set -euo pipefail

echo "Starting dev environment setup..."

echo "Installing packages..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y \
	python3-neovim \
	python3-venv \
	python3 \
	npm \
	clang \
	tmux \
	git \
	fuse \
	ripgrep \
	fd-find \
	fzf \
	make \
	unzip \
	curl \
	build-essential

# X11/hardware tools — skip on WSL
if [ -z "${WSL_DISTRO_NAME:-}" ]; then
	sudo apt install -y brightnessctl autorandr
fi

echo "Creating directories..."
mkdir -p "$HOME/documents/repos/"

# echo "Updating npm..."
# # Update Node , used by some LSP's.
# sudo npm cache clean -f --verbose
# sudo npm install -g n  --verbose
# sudo n stable


echo "Installing latest Neovim..."
# Installing latest nvim and allow for global access of the command "nvim"
# Also adds nvim dependencies

NVIM_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage"
NVIM_SHA_URL="https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage.sha256sum"

wget -q "$NVIM_URL" -O nvim.appimage
wget -q "$NVIM_SHA_URL" -O nvim.appimage.sha256sum
sha256sum --check nvim.appimage.sha256sum

sudo chmod u+x nvim.appimage
sudo mv -f nvim.appimage /usr/bin/nvim
sudo chmod 755 /usr/bin/nvim
rm -f nvim.appimage.sha256sum


echo "Setting up Neovim configs..."
mkdir -p "$HOME/.config/nvim"
cp -fra nvim/. "$HOME/.config/nvim"


echo "Applying personal configs..."
# i3 config is only relevant outside WSL
if [ -z "${WSL_DISTRO_NAME:-}" ]; then
	mkdir -p "$HOME/.config/i3"
	cp -f i3_config "$HOME/.config/i3/config"
fi
cp .bashrc "$HOME/"
cp .tmux.conf "$HOME/"

echo "Environment setup completed."
