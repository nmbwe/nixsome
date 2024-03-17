{ config, pkgs ? import (fetchTarball "github:NixOS/nixpkgs/nixos-unstable"), ... }:
{
    #Set my neovim here
    #neovim.url = ""
    virtualisation.docker.enable = true;    
    programs.steam = {
	    enable = true;
	    gamescopeSession = {
		    enable = true;
	    };	
    };
	
    environment = {
        systemPackages = with pkgs; [
	    gamemode
        gamescope
	    distrobox
	    #bitcoin
            bitcoin
            firefox
            #Ide's and Pde's
            nano
            vscode
            neovim
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
