#!/bin/bash
#
#Install packages
#
# Add Oh my zshell

declare -a PACKAGES=(
git
curl
wget
neovim
zoxide
tmux
zsh
python
ttf-hack
yay
obsidian
firefox
chromium
keepassxc
openvpn
xclip
wl-clipboard
sublime-text
)

# Add sublimetext repo
# TODO change it so it checks if its not already added
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu

for PACKAGE in ${PACKAGES[@]}; do
    echo "Installing $PACKAGE"
    sudo pacman -S $PACKAGE
    echo ""
done

# Replace dotfilles

declare -a FILES=(
.inputrc
.tmux.conf
.config/nvim/init.vim
)

replaceFile(){
	cp "$PWD/$1" "$HOME/$1"
	echo "File $FILE replaced"
    echo ""
}

for FILE in ${FILES[@]}; do
	if [ -f "$PWD/$FILE" ]; then
		if [ -f "$HOME/$FILE" ]; then
			echo "$HOME/$FILE already exist diff:"
			diff  -s "$PWD/$FILE" "$HOME/$FILE"
			read -e -p "Do you want to replace existing $FILE file? (y/n): " INPUT
			if [[ $INPUT == 'y' || $INPUT == 'Y' ]]; then
				replaceFile $FILE
			else
				echo "Skipping"
                echo ""
			fi
		else
			replaceFile $FILE
		fi
	else
		echo -e "\e[31mFile $PWD/$FILE does not exist\e[0m"
	fi
done

# Tmux plugin manager 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Pres <prefix> + I to install tmux plugins"
echo "Remember to setup Timeshift"
echo "replace binnary sublime with :s/807805000f94c1/c64005014885c9/g"


