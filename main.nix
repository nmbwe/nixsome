{ lib, config, pkgs, ... }:

{
  wsl = {
    enable = true;
    defaultUser = "JoaoLeal";
  };


  environment.systemPackages = with pkgs; [
    wget
    vim
    just
    distrobox
    yubikey-manager
    git
    just
    usbutils
  ];
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
  hardware.gpgSmartcards.enable = true;
  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };

  networking.hostName = "nixos";
  time.timeZone = "UTC";
  users.users.joaoLeal = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
