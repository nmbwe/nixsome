# aliases.nix
{ pkgs, ... }: {
  environment.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    nvim = "nix run github:jaoleal/pnin";
    arch = "newgrp docker && distrobox enter archbox";
  };
}