{ config, pkgs, ... }:

{
  imports = [
    ./usbip.nix
  ];



  wsl = {
    enable = true;
    defaultUser = "JoaoLeal";
    usbip = {
      enable = true;
      autoAttach = ["2-8"];
    };
  };

 
  environment.systemPackages = with pkgs; [
    wget
    vim
    just 
    distrobox
    
  ];

  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
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
