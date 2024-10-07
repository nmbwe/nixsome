{ lib, pkgs, ... }:
{


	imports = [
./hardware-configuration.nix];  

environment.systemPackages = with pkgs; [
    wget
    vim
    just
    distrobox
    yubikey-manager
    usbutils
    nixpkgs-fmt
    nixd
    rustup
    pkg-config
    openssl
    clang
  ];
  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
  };

  users.users.jaoleal = {
    isNormalUser = true;
    description = "Joao Leal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };
  services.xserver = { 
	enable = true;
	desktopManager.gnome.enable = true;
	displayManager.gdm.enable = true;
};
virtualisation.podman = {
  enable = true;
  dockerCompat = true;
};  
nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos";
  services.udev.packages = [ pkgs.yubikey-personalization ];
services.dbus.packages = [ pkgs.gcr ];
services.flatpak.enable = true; 
	security.pam.yubico = {
   enable = true;
   debug = false;
   mode = "challenge-response";
   id = [ "28625726" ];
};

services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    };
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
	boot= {
	  initrd.luks.devices."luks-8970f121-a76c-44b7-8be8-9c5ad0d4a229".device = "/dev/disk/by-uuid/8970f121-a76c-44b7-8be8-9c5ad0d4a229";
loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};};
	  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

