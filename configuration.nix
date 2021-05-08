{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  legacy = import <nixos-legacy> {};
in
{
  imports = [
    ./hardware-configuration.nix
    ./nix-config/servers/example/configuration.nix
  ];
  system.stateVersion = "20.09";
}

