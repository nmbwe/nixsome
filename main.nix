{ lib, pkgs, ... }:
{
  systemPackages = with pkgs; [
    wget
    vim
    just
    distrobox
    yubikey-manager
    git
    just
    usbutils
    nixpkgs-fmt
    nixd
    gnupg
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
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };

  nixosConfig = lib.mkIf (pkgs.stdenv.isLinux && pkgs.stdenv.isNixos) {
    wsl = {
      enable = true;
      defaultUser = "JoaoLeal";
    };
    networking.hostName = "nixos";
    time.timeZone = "UTC";
    users.users.JoaoLeal = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    services.udev.packages = [ pkgs.yubikey-personalization ];
    services.pcscd.enable = true;
    hardware.gpgSmartcards.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
