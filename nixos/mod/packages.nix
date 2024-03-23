{ config, pkgs ? import (fetchTarball "github:NixOS/nixpkgs/nixos-unstable"), ... }:
{
    environment = {
        systemPackages = with pkgs; [
        gamemode
        distrobox
        #bitcoin
        bitcoin
        firefox
        #Ide's and Pde's
        vscode
        #Socials
        mullvad-vpn
        mullvad
        signal-desktop
        #dev tools
        direnv
        docker
        wget
        git
        alacritty
        zsh
        tmux
        gnupg
        ];
    };
}
