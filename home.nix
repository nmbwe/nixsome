{ config, pkgs, ... }:

{
  home = {
    username = "jaoleal";
    homeDirectory = "/home/jaoleal";
    stateVersion = "24.05"; # Dont change.
    packages = with pkgs; [ git pinentry-tty gnupg];
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
      pinentryPackage = pkgs.pinentry-tty;        
	};
  };
  programs = {
    git = {
      enable = true;
      userEmail = "jgleal@protonmail.com";
      userName = "jaoleal";
      signing = {
        key = "0xAD9A025AA978D435";
        signByDefault = true;
      };
    };
    gpg = {
        enable = true;
    };
    home-manager.enable = true;
    bash.enable = true;
    bash.bashrcExtra = ''
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
	echo Haro '';
    };
}
