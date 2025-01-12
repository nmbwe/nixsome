{ lib, pkgs, config,  ... }:
{


  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    vim
    just
    yubikey-manager
    usbutils
    nixpkgs-fmt
    nixd
    rustup
    pkg-config
    signal-desktop
    openssl
    clang
  ];
  users.users.jaoleal = {
    isNormalUser = true;
    description = "Joao Leal";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    videoDrivers = ["nvidia"];
  };
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "SM8953";
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.dbus.packages = [ pkgs.gcr ];
  services.flatpak.enable = true;
  services.pcscd.enable = true;
  services.tailscale.enable = true;
  networking.networkmanager.enable = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

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
time.hardwareClockInLocalTime = true;
  boot = {
    loader = {
  	grub.enable = true;
  	grub.device = "nodev";
	grub.useOSProber = true;
	grub.efiSupport = true;
efi.canTouchEfiVariables = true;
    };
  };
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
