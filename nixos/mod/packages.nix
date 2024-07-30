{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnupg
    podman
    home-manager
    just
    fd
    ripgrep
    gcc
    vscode
    sparrow
    firefox
    tor
    luajitPackages.luarocks-nix
    tor-browser
    lutris
    neovim
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
