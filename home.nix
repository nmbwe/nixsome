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
        key = "0xDCDC435C64AA150C176DCB7720065F33EDAD58FA";
        signByDefault = true;
      };
    };
    home-manager.enable = true;
    bash.enable = true;
    bash.bashrcExtra = ''
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
	echo Haro '';
    };
}
