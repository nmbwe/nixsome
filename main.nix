{ lib, pkgs, ... }:
{


  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    vim
    just
    quickemu
    yubikey-manager
    usbutils
    nixpkgs-fmt
    nixd
    rustup
    pkg-config
    openssl
    clang
  ];
  # Binary Cache for Haskell.nix
  nix.settings.trusted-public-keys = [
    "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
  ];
  nix.settings.substituters = [
    "https://cache.iog.io"
  ];
  services.spice-vdagentd.enable = true;
  users.users.jaoleal = {
    isNormalUser = true;
    description = "Joao Leal";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos";
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.dbus.packages = [ pkgs.gcr ];
  services.flatpak.enable = true;
  services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;
  services.tailscale.enable = true;
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
  boot = {
    initrd.luks.devices."luks-8970f121-a76c-44b7-8be8-9c5ad0d4a229".device = "/dev/disk/by-uuid/8970f121-a76c-44b7-8be8-9c5ad0d4a229";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
