#!/bin/bash

# Install required programs
# TODO add other package managers

declare -a PACKAGES=(
git
curl
vim
python
fonts-hack-ttf
)

for PACKAGE in ${PACKAGES[@]}; do
    echo "Installing $PACKAGE"
    sudo apt install $PACKAGE -y
    echo ""
done

# Replace dotfilles

declare -a FILES=(
.bash_aliases
.bash_logout
.bash_profile
.bashrc
.inputrc
.vimrc
.tmux.conf
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

# Install Vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install gruvbox

git clone https://github.com/morhetz/gruvbox ~/.vim/colors/gruvbox
cp ~/.vim/colors/gruvbox/colors/gruvbox.vim ~/.vim/colors

echo "Remember to run PluginInstall in vim and gruvebox_256palette.sh"
echo "Pres <prefix> + I to install tmux plugins"

