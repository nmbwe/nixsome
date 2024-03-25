{ config, lib, pkgs, ... }:
{
  imports =
  [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
  ];
  ##Read it
  networking.hostName = "TheChosenOne";
  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  ##some amd configurations
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  environment.variables.AMD_VULKAN_ICD = "RADV";

  # enables flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true; 
  nixpkgs.config.unstable = {
    # The URL for the unstable channel
    url = "https://nixos.org/channels/nixos-unstable";
    # Use the latest revision of the channel
    channel = "nixos-unstable";
  };

  time.timeZone = "America/Sao_Paulo";
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  #Enable cachix
  nix.settings = {
    substituters = [ "https://ezkea.cachix.org" ];
    trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
  };

  #Ensure suport for mousepad
  services.xserver.libinput.enable = true;

  #Fiat Piak 
  services.flatpak.enable = true; 

  #Who, in 2024 let someone else use its computer ? BEEING AN NIXOS ?????????
  users.users.joaoleal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
  };
  virtualisation.docker.enable = true;
  #SSH Settings. Finish Later
  #services.openssh = {
  #	enable = true;
  #	settings = {
  #	PermitRootLogin = "yes";
  #	PasswordAuthentication = true;
  #	};
  #};

  # Open ports in the firewall.
  /*   networking.firewall = {
    enable = true; 
    allowedTCPPorts = [];
    allowedUDPPorts = [ {from = 8000; to = 10000;} ];
  };
   */
   
  
  #Do not Change.
  system.stateVersion = "23.11"; # Did you read the comment? Yeah, i did.

}