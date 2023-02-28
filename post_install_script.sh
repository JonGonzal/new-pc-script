

#sudo apt update; sudo apt upgrade -y



sudo apt install tmux -y

sudo apt install git -y

sudo apt install termius -y

sudo apt install python3.10-venv -y

if [[ -e ~/Documents/repos ]]; then
	echo "Path exist" 
else
	sudo mkdir -P ~/Documents/repos
	echo "Created path '~/Documents/repos'"
fi

# Check's if display exists and install GUI apps 
if [ -n "${DISPLAY+x}" ]; then 
	sudo apt install i3 -y

	sudo apt install gimp -y



	# Installing latest chrome
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

	sudo apt install ./google-chrome-stable_current_amd64.deb -y

	rm google-chrome-stable_current_amd64.deb

fi

## Instaing latest nvim and allow for global access of the command "nvim"
# Also adds nvim dependencies 

#wget -P ~/ https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#
#sudo chmod u+x ~/nvim.appimage
#
#mv ~/nvim.appimage ~/nvim
#
#sudo ln -s ~/nvim /usr/bin/
#
#ls -lah /usr/bin | grep "nv"


#sudo apt install python3-neovim -y

#sudo apt install npm -y

#sudo apt install clang -y

## Kickstarting nvim 

# Creates the NVIM environment
git clone https://github.com/JonGonzal/kickstart.nvim.git ~/Documents/repos/

sudo mv ~/Documents/repos/kickstart.nvim/ ~/.config/

mv ~/.config/kickstart.nvim/ ~/.config/nvim
