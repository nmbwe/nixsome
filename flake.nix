{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {system = system; };
      common = import ./main.nix {inherit pkgs; lib = pkgs.lib;   };
    in
    {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = system;

        modules = [
          nixos-wsl.nixosModules.default
          {
            
            system.stateVersion = "24.05";
          }
          common.nixosConfig 
          common
        ];
      };
    };
      packages = {
        "${system}" = pkgs.buildEnv {
          name = "my-env";
          paths = common.systemPackages;
        };
      };

      # Default package for `nix run` or `nix develop`.
      defaultPackage.${system} = self.packages.${system};
  };

  description = "Remember the DISSSSS ?";
}