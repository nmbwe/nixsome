{ config, lib, pkgs ? import (fetchTarball "github:NixOS/nixpkgs/nixos-unstable"), ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];
##Read it
networking.hostName = "TheChosenOne";

  # Use the systemd-boot EFI boot loader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;


# enables flakes
nix.settings.experimental-features = [ "nix-command" "flakes" ];

nixpkgs.config.allowUnfree = true; 
nixpkgs.config.unstable = {
    # The URL for the unstable channel
    url = "https://nixos.org/channels/nixos-unstable";
    # Use the latest revision of the channel
    channel = "nixos-unstable";
  };
#Time zone.
time.timeZone = "America/Sao_Paulo";


#Activate all cinnamon packages
## i`ll remove it soon to use hyprland, but for now.
services.xserver.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.cinnamon.enable = true;

#TODO -  add pt-br keyboard and toogle key
  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

# Enable sound.
sound.enable = true;
hardware.pulseaudio.enable = true;

#Ensure suport for mousepad
services.xserver.libinput.enable = true;

#Fiat Piak 
services.flatpak.enable = true;
 

#Who, im 2024 let someone else use its computer ? BEEING AN NIXOS ?????????
users.users.joaoleal = {
	isNormalUser = true;
	extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
};

programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = true;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
};
#My Packages
environment.systemPackages = with pkgs;
[
	kitty
	nano
	wget
	git
    signal-desktop
	alacritty
	zsh
	home-manager
	tmux
    vscode
    docker
    (python3.withPackages(python-pkgs: [
      python-pkgs.ecdsa
    ]))
    discord
    brave
    ##i, joão leal, am not using this... it work related, i dont know anything about it
    mullvad-vpn
    mullvad
    gnupg
];
  
  users.defaultUserShell = pkgs.zsh;  	
  programs.zsh.enable = true; 
#  programs.alacritty = {
#	  enable = true;
#	  shell = {
#      program = "${pkgs.zsh}/bin/zsh";
#      args = [
#
#             "--hold -e tmux"
#      ]; 
#    };
#  };


#fonts

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
];

  # List services that you want to enable:
	
#SSH Settings. Finish Later
#services.openssh = {
#	enable = true;
#	settings = {
#	PermitRootLogin = "yes";
#	PasswordAuthentication = true;
#	};
#};

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

system.copySystemConfiguration = true;

 #Do not Change.
  system.stateVersion = "23.11"; # Did you read the comment? Yeah, i did.

}

