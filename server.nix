{ pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
  ];

  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "sm2024" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "yes";
    };
  };
  services.bitcoind.mainnet = {
	enable = true;
	dataDir = "/var/blockchain/";
	configFile = "/home/sm2024/nixsome/cfg/bitcoin/bitcoin.conf";  
 };

  environment.systemPackages = with pkgs; [
    wget
    vim
    just
    yubikey-manager
    usbutils
  ];
  users.users.sm2024 = {
      isNormalUser = true;
      description = "Server User";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

  nixpkgs.config.allowUnfree = true;

  services.pcscd.enable = true;
  services.tailscale.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.dbus.packages = [ pkgs.gcr ];

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

  time.hardwareClockInLocalTime = true;

  boot.loader.systemd-boot.enable = true;

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  system.stateVersion = " 24.05 "; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
