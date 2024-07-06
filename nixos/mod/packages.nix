{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    podman
    home-manager
    just
    sparrow
    firefox
    tor
    tor-browser
    lutris
    wine
    gamescope
    distrobox
    zellij
    syncthing-tray
    syncthing
    mullvad-vpn
    discord
    mullvad
    signal-desktop
    protonmail-desktop
    keepassxc
    alacritty
    #dev tools
    direnv
    wget
  ];
}
