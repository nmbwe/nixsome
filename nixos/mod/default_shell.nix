{ pkgs, ... }: {
  environment.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    nvim = "nix run github:jaoleal/pnin";
  };
}