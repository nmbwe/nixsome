## Flakes

{
  description = "My NixOS configuration";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      packages = [import ("./nixos/packages.nix")];
      system = [import ("./nixos/system.nix")];
      Deskop_Environment = [import ("./nixos/de.nix")];
    };
    outputs = { self, nixpkgs, packages, system, Deskop_Environment }: {
    nixosConfigurations.TheChosenOne = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./config.nix ];
    };
  };
}
