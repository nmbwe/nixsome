#!/bin/sh

## This is a temporary way to just move the configuration to /etc/nixos/
## and apply them.

## Requires sudo permition

echo "Run with sudo"

cp ./nixos/configuration.nix /etc/nixos/
nixos-rebuild switch
