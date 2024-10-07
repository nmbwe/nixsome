{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {system = system; };
      common = import ./main.nix {inherit pkgs; lib = pkgs.lib;   };
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
  description = "Remember the DISSSSS ?";
	};
}
