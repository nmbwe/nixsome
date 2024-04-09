{ config, pkgs ? import (fetchTarball "github:NixOS/nixpkgs/nixos-unstable"), ... }:
{
  
  environment = {
    systemPackages = with pkgs; [
      steam
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
      git
      alacritty
      direnv
      wget
    ]; 
  }; 
}