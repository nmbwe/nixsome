{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    };

  outputs = { self, nixpkgs, ... }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {system = system; };
      common = import ./main.nix {inherit pkgs; lib = pkgs.lib;   };
      rustshit = import ./rust.nix {inherit pkgs; };
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
