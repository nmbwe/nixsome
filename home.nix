{ config, pkgs, ... }:

{
  home = {
    username = "jaoleal";
    homeDirectory = "/home/jaoleal";
    stateVersion = "24.05"; # Dont change.
    packages = with pkgs; [ git ];
    file = { };
    sessionVariables = { };
  };
  services = {
    gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtlSsh = 4000;

      defaultCacheTtl = 34560000;
      maxCacheTtl = 34560000;
    };
  };
  programs = {
    git = {
      enable = true;
      userEmail = "jgleal@protonmail.com";
      userName = "jaoleal";
      signing = {
        key = "0x80A9E51B3B06FE4A";
        signByDefault = true;
      };
    };
    home-manager.enable = true;
  };
}
