{ pkgs, lib, ... }:
{
  nixpkgs.config.packageOverrides = with lib; pkgs: rec {
    # Nix User Repository
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
  };
}
