

echo "updating"
sudo apt update; sudo apt upgrade -y



sudo apt install tmux

sudo apt install git


# Check if display exist
if [ -n "${DISPLAY+x}" ]; then 
	sudo apt install i3

	sudo apt install gimp



	# Installing latest chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

	sudo apt install ./google-chrome-stable_current_amd64.deb

	rm google-chrome-stable_current_amd64.deb

fi

## Instaing latest nvim and allow for global access of the command "nvim"
# Also adds nvim dependencies 
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
mv ~/nvim /user/bin/

sudo apt install python3-neovim

sudo apt install npm

sudo apt install clang


