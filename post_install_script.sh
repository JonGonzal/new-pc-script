#! /bin/bash

set -e

echo "Starting dev environment setup..."

echo "Installing packages..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y \
	python3-neovim  \
	python3-venv \
	python3 \
	npm  \
	clang  \
	tmux  \
	brightnessctl  \
	git  \
	fuse  \
	autorandr

echo "Creating directories..."
mkdir -p "$HOME/documents/repos/"

echo "Updating npm..."
# Update Node , used by some LSP's.
sudo npm cache clean -f
sudo npm install -g n 
sudo n stable


echo "Installing latest Neovim..."
# Installing latest nvim and allow for global access of the command "nvim"
# Also adds nvim dependencies 

wget -P . https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage -O nvim.appimage
sudo chmod u+x nvim.appimage
sudo mv -f nvim.appimage /usr/bin/nvim
sudo chmod 755 /usr/bin/nvim


echo "Setting up Neovim configs..."
sudo mkdir -p "$HOME/.config/nvim"
sudo cp -fra nvim/. "$HOME/.config/nvim"


echo "Applying personal configs..."
mkdir -p "$HOME/.config/i3/config"
cp -f i3_config "$HOME/.config/i3/config"
cp .bashrc "$HOME/"
cp .tmux.conf "$HOME/"

echo "Environment setup completed."
