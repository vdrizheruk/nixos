{ config, pkgs, ... }:
{
imports = [
./hardware-configuration.nix
./nix-config/servers/example/configuration.nix
];
system.stateVersion = "20.09";
}

