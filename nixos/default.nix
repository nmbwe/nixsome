{pkgs, ...}:

{
  imports = [
    ./mod/default_shell.nix
    ./mod/packages.nix
    ./mod/de.nix
    ./mod/git.nix
    ./mod/system.nix
    ./hardware-configuration.nix
  ];
}