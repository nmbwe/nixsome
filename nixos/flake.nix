{
  description = "The config from TheChosenOne";
  
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvix = {
      url = "github:jaoleal/nvix";
      inputs.nixpkgs.follows = "nixpkgs";    
      };
  };

  outputs = { self, nixpkgs, nvix, ... }@inputs: {
    #nixpkgs.overlays = [nvix.overlays.default];
    nixosConfigurations.TheChosenOne = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./default.nix
      ];
    };
  };
}
