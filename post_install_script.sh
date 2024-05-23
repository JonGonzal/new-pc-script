## Personal linux env for dev
sudo apt update; sudo apt upgrade -y
sudo apt install python3-neovim -y
sudo apt install npm -y
sudo apt install clang -y
sudo apt install tmux -y
sudo apt install brightnessctl -y
sudo apt install git -y
sudo apt install termius -y
sudo apt install python3.10-venv -y
sudo apt install snapq
sudo apt install fuse
sudo snap install --classic code
sudo apt install autorandr

mkdir -p ~/documents/repos/


# Update Node , used by some LSP's.
sudo npm cache clean -f
sudo npm install -g n 
sudo n stable

if [[ -e ~/documents/repos ]]; then
	echo "Path exist" 
else
	sudo mkdir -P ~/documents/repos
	echo "Created path '~/documents/repos'"
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

# Installing latest nvim and allow for global access of the command "nvim"
# Also adds nvim dependencies 

wget -P ~/ https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

sudo chmod u+x ~/nvim.appimage

mv ~/nvim.appimage ~/usr/bin/nvim
sudo chmod 755 ~/usr/bin/nvim

# Kickstarting nvim 
# Creates the NVIM environment
git clone https://github.com/JonGonzal/kickstart.nvim.git ~/documents/repos/kickstart_nvim

sudo mv ~/documents/repos/kickstart_nvim/ ~/.config/
mv ~/.config/kickstart_nvim/ ~/.config/nvim

# Installs personal configs 
git clone https://github.com/JonGonzal/new-pc-script.git ~/documents/repos/new-pc-script/

sudo cp -f ~/documents/repos/new-pc-script/i3_config ~/.config/i3/config
sudo cp ~/documents/repos/new-pc-script/.bashrc ~/
sudo cp ~/documents/repos/new-pc-script/.tmux.config ~/
