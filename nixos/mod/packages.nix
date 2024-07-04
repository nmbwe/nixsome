{ config, pkgs,... }:
{
environment.systemPackages = with pkgs; [
    gnupg
    
    home-manager

    sparrow
    firefox
    tor-browser
    lutris
    wine
    gamescope
    distrobox

    syncthing-tray
    syncthing

    mullvad-vpn
    discord
    mullvad
    signal-desktop
    protonmail-desktop
    keepassxc

    #dev tools
    direnv
    wget
  ]; 
}
