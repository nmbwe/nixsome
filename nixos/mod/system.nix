{ config, lib, pkgs, ... }:
{
  imports =
  [ # Include the results of the hardware scan.
      ../hardware-configuration.nix  
  ];
  ##Read it
  networking = {
    hostName = "TheChosenOne";
    networkmanager.dns = "systemd-resolved";
    };
  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
  };

  services.pcscd.enable = true;
  programs.nix-ld.enable = true;
	programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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

  #support for mullvad
  services = {
    mullvad-vpn.enable = true;
    #Ensure suport for mousepad
    libinput.enable = true;
    #Fiat Piak
    flatpak.enable = true;
    #DNS go brr
    resolved.enable = true;
    
  };

  

   

  #Who, in 2024 let someone else use its computer ?
  users.users.joaoleal = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "maintainer"]; # Enable ‘sudo’ for the user.
  };
  systemd.tmpfiles.rules = [
  "d /etc/nixos 775 - joaoleal maintainer"
  ];
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
  networking.firewall = {
    enable = true; 
    allowedTCPPorts = [ 38332 ];
  };

  #Do not Change.
  system.stateVersion = "23.11"; # Did you read the comment? Yeah, i did.

}
