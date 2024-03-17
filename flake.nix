## Flakes

{
  description = "My NixOS configuration";
    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      polymc.url = "github:PolyMC/PolyMC";
    };
    nixpkgs.overlays = [ inputs.polymc.overlay ];
    outputs = { self, nixpkgs }: { 
      nixosConfigurations.TheChosenOne = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/mod/de.nix
          ./nixos/mod/system.nix
          ./nixos/mod/packages.nix
          ./nixos/mod/bitcoin.nix
          ];
      };
      environment.systemPackages = with pkgs; [ polymc ];
  };
}
