#!/bin/bash


# VSCode 
#{
#  "key": "f8",
#  "command": "workbench.action.terminal.runSelectedText",
#  "when": "editorTextFocus && editorLangId == 'shellscript'"
#}

dystro=$(uname -a)

if [[ $dystro == *"Ubuntu"* ]]; then
    declare -a appList=(
        wget
        curl
        neovim
        xclip
        zoxide
        tmux
        zsh
        python
        tldr
        scc
        exa
        fastfetch
        duf # disk usage
        entr # Watch for changes and run command
        exiftool
        fzf
        procs
        rip
        ripgrip
        rsync
        xsel
        bandwich
        ctop
        bpytop
        glances
        gping
        dua-cli
        dog # (in snap at deg add from github?)
        mutt
        ipcalc
    )
    sudo apt-get update && sudo apt-get upgrade

    for package in "${appList[@]}"; do
        echo "Installing $package"
        sudo apt-get install "$package" -y
        echo ""
    done

    sudo apt install $a
    echo "aaaa"
fi


#if [ $dystro -eq ''
