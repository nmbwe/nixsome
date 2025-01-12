{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      nixDevShell = import ./nixdev.nix { pkgs = import nixpkgs { system = system; }; };
    in
    {
      nixosConfigurations = {
        mainConfig = nixpkgs.lib.nixosSystem {
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
