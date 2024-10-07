{ pkgs }:

pkgs.mkShell {
  name = "nix-dev-shell";
  
  buildInputs = [
    pkgs.nix
    pkgs.nixpkgs-fmt  # for formatting Nix files
    pkgs.niv          # Nix version manager
    pkgs.curl         # for downloading resources
    pkgs.direnv       # environment variable management     
  ];
  shellHook = '' '';
}
