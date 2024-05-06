{config, pkgs, ...} : 
{
    imports = [ <home-manager/nixos> ];
    home-manager.users.joaoleal = {
      isNormalUser = true;
      home.stateVersion = "23.11";
      useUserPackages = true;
    };
    home-manager.useGlobalPkgs = true;
}