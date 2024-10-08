{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; };
      common = import ./main.nix { inherit pkgs; lib = pkgs.lib; };
      nixDevShell = import ./nixdev.nix { pkgs = import nixpkgs { system = system; }; };
    in
    {
      nixosConfigurations = {
        mainConfig = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            common
          ];
        };
      };
      devShells = {
        x86_64-linux = { default = nixDevShell; };
      };
    };

  description = "Remember the DISSSSS ?";
}
