{ pkgs, ... }:

pkgs.mkShell {
  name = "nix-dev-shell";
  
  buildInputs = with pkgs; [
    nix
    nixpkgs-fmt  # for formatting Nix files
    niv          # Nix version manager
    curl         # for downloading resources
    direnv       # environment variable management     
    nixd	  
];
  shellHook = '' '';
}
