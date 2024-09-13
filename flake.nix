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
            imports = [./usbip.nix];
            system.stateVersion = "24.05";
            wsl = {
              enable = true;
              defaultUser = "JoaoLeal";
              usbip = {
                autoAttach = ["2-8"];
              };
            };

            programs = {
              nix-ld = {
                enable = true; 
                package = nixpkgs.nix-ld-rs; 
              };
            };

            environment.systemPackages = [
              nixpkgs.wget
            ];

            nix.settings.experimental-features = [ "nix-command" "flakes" ];

          }
        ];
      };
    };
  };

  description = "Remember the DISSSSS ?";
}