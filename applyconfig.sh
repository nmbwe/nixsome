#!/bin/sh

## This is a temporary way to just move the configuration to /etc/nixos/
## and apply them.

## Requires sudo permition

echo "Updating NixOS Configuration with the actual flake.nix"

## Copy the system aproprieate hardware-config.nix to this repo to copy back later

cp /etc/nixos/hardware-configuration.nix ./nixos/

## copy the whole directorie so i dont need to handle with paths now.
cp ./* /etc/nixos/
nixos-rebuild switch
