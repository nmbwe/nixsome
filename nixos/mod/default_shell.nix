# aliases.nix
{ pkgs, ... }: {
  environment.shellAliases = {
    ls = "ls --color=auto";
    ll = "ls -l";
    # add more aliases here...
  };
}