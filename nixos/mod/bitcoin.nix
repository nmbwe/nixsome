{ config, lib, pkgs, ... }:
{
  #all bitcoin configuration goes here
  services.bitcoind.joaoleal = {
    enable = true;
    testnet = true;
    prune = 10240;
  };
}