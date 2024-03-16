{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    
      
      ./hardware-configuration.nix
      
      

	#Developer environment settings and programs
	#./devenv.nix    
  ];
##Read it
networking.hostName = "TheChosenOne";

  # Use the systemd-boot EFI boot loader.
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;


# enables flakes
nix.settings.experimental-features = [ "nix-command" "flakes" ];

nixpkgs.config.permittedInsecurePackages = [
                "openssl-1.1.1w"
              ];

nixpkgs.config.allowUnfree = true; 
nixpkgs.config.unstable = {
    # The URL for the unstable channel
    url = "https://nixos.org/channels/nixos-unstable";
    # Use the latest revision of the channel
    channel = "nixos-unstable";
  };

# Basic Network config for this shit work.
# it doesnt work for me without it.

networking.useDHCP = lib.mkForce  true;
networking.networkmanager= lib.mkForce {
	enable = true; 
	insertNameservers = [
	"9.9.9.9" "149.112.112.112"
	"1.1.1.1" "1.0.0.1"
	"8.8.8.8" "8.8.4.4" 
	];
};
#Time zone.
time.timeZone = "America/Sao_Paulo";


#Activate all cinnamon packages
## i`ll remove it soon to use hyprland, but for now.
services.xserver.enable = true;
services.xserver.displayManager.lightdm.enable = true;
services.xserver.desktopManager.cinnamon.enable = true;



  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

# Uncomment to Use X11
# services.xserver.enable = true;
# Configure keymap in X11
# services.xserver.xkb.layout = "us";
# services.xserver.xkb.options = "eurosign:e,caps:escape";

# Enable sound.
sound.enable = true;
hardware.pulseaudio.enable = true;

#Ensure suport for mousepad
services.xserver.libinput.enable = true;
services.flatpak.enable = true;
  
users.users.joaoleal = {
	isNormalUser = true;
	extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	     packages =   [
	     	pkgs.firefox
     		];
};

programs.hyprland.enable = true;

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
  vim
	nano
	wget
	git
  jq
  signal-desktop
	alacritty
	zsh
	home-manager
	tmux
	lunarvim
  vscode
  docker
  (python3.withPackages(python-pkgs: [
      python-pkgs.ecdsa
    ]))
	nodejs_21
	rustup
	helix
  bitcoin
    discord
  shutter
  jdk20
  libgcc
  gcc
  wineWowPackages.waylandFull
  sublime4
  google-chrome
  brave
  ##i, joão leal, am not using this... it work related, i dont know anything about it
  mullvad-vpn
  mullvad
  godot3
  openssl
  openssl.dev  
  pkg-config
  libiconv
  trunk  
  gnupg
  pinentry
  firecracker
  firectl  
  zola
  
  #Language Servers
  
  ##HTMl,CSS,JS
  vscode-langservers-extracted
  ##Lua
  lua-language-server
  ##MD
  marksman
  ##Rust
  rust-analyzer
  ##C/C++
  llvmPackages_17.clang-unwrapped
  ##Nix
  nil
  #BASH
  nodePackages_latest.bash-language-server
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

