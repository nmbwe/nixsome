{ pkgs, ... }: {
  environment.variables = {
    # Tell to alacritty where to look over config files

    # Tell to nvim where to look over config files

  };
  environment.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    nvim = "nix run github:jaoleal/pnin";
  };
}