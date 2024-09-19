default:
    @just --list

set-build:
    @just set-conf
    @just build

build:
    sudo nixos-rebuild switch

set-conf:
    #!/usr/bin/env bash
    sudo rm -rf /etc/nixos/*
    sudo cp *.nix /etc/nixos/

prof-install:
    nix profile install --experimental-features 'nix-command flakes'
