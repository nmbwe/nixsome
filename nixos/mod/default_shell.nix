{ nixpkgs, lib ? nixpkgs.lib, ... }: {
  environment.variables = {
    #define variables here
  };
  environment.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    vix = "nix run \"github:jaoleal/nvix\"";
  };
}
