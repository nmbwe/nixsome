#!/bin/sh

## This is a temporary way to just move the configuration to /etc/nixos/
## and apply them .
echo "Updating NixOS and Home Manager Configuration with the actual flake.nix"
sleep 1 && clear
## Copy the system apropriate hardware-config.nix to this repo to copy back later
## Just to not break anything, NixOs has a generated file to handle "Hardware shit"
if [ -d "$HOME/.config" ]; then
    cp -r ./home-manager/ "$HOME/.config/"
    #/home/joaoleal/nixsome/nixos
    nixos-rebuild --use-remote-sudo -I nixos-config=/home/joaoleal/nixsome/nixos switch > /dev/null
    
    home-manager switch > /dev/null

    home-manager expire-generations 7d > /dev/null
    
    nix-collect-garbage --delete-older-than 4d > /dev/null
    clear
    echo "Done my bro"
else
    echo "dot config just does not exists pal, cannot copy Home-manager config"
fi
