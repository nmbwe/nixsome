{
  inputs = {
    pkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs = { self, pkgs, ... }:
    let
      system = "x86_64-linux";
      nixDevShell = import ./nixdev.nix {
        pkgs = import pkgs {
          system = system;
        };
      };
    in
    {
      nixosConfigurations = {
        mainConfig = pkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./main.nix
          ];
        };
      };
      devShells = {
        x86_64-linux = { default = nixDevShell; };
      };
    };

  description = "Remember the DISSSSS ?";
}
