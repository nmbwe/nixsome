{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "24.05";

            wsl = {
              enable = true;
              defaultUser = "JoaoLeal";
            };

            programs = {
              nix-ld = {
                enable = true; 
                package = pkgs.nix-ld-rs; 
              };
            };

            enviroment.systemPackages =  with pkgs;[
              wget 
            ];

            nix.settings.experimental-features = [ "nix-command" "flakes" ];

          }
        ];
      };
    };
  };

  description = "Remember the DISSSSS ?"
}