#!/bin/sh

## This is a temporary way to just move the configuration to /etc/nixos/
## and apply them .
echo "Updating NixOS and Home Manager Configuration"
sleep 1 && clear
## Copy the system apropriate hardware-config.nix to this repo to copy back later
## Just to not break anything, NixOs has a generated file to handle "Hardware shit"
if [ -d "$HOME/.config" ]; then
    cp -r ./home-manager "$HOME/.config/"
    #/home/joaoleal/nixsome/nixos

    sudo cp -r nixos /etc/

    sudo nixos-rebuild switch
    
    #home-manager switch
else
    echo "dot config just does not exists pal, cannot copy Home-manager config"
fi
