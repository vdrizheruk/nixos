{ config, pkgs, lib, ... }:

with lib;

{
  imports = [
    <nixpkgs/nixos/modules/profiles/hardened.nix>
    ./generic/overlays/default.nix
    ./generic/programs/ssh.nix
    ./generic/security/ssh-hosts.nix
    ./generic/services/fail2ban.nix
    ./generic/services/logrotate.nix
    ./generic/services/sshd.nix
    ./generic/services/syslog.nix
    ./generic/services/unbound.nix
    ./generic/ids.nix
    ./generic/locale.nix
    ./generic/pkgs.nix
    ./generic/shell.nix
    ./generic/tweaks.nix
  ];

  boot = mkOverride 700 {
    kernelPackages = pkgs.linuxPackages_latest_hardened;
    loader.grub.enable = true;
    loader.grub.version = 2;
    cleanTmpDir = true;
    tmpOnTmpfs = false;
  };

  hardware.ksm = mkDefault {
    enable = true;
    sleep = 1000;
  };

  environment.memoryAllocator.provider = mkOverride 700 "jemalloc";

  networking = mkDefault {
    enableIPv6 = false;
    firewall.enable = false;
    useHostResolvConf = false;
    usePredictableInterfaceNames = false;
    useDHCP = false;
    interfaces.ens18.useDHCP = true;
  };

  nix = mkDefault {
    gc.automatic = false;
    optimise.automatic = true;
    readOnlyStore = true;
    package = pkgs.nix;
  };

  security.sudo = mkDefault {
    enable = true;
    wheelNeedsPassword = false;
  };

  services.journald = mkDefault {
    extraConfig = ''
      ForwardToSyslog=yes
      SystemMaxUse=256M
    '';
  };

  services.qemuGuest = mkDefault {
    enable = true;
  };

#  users = mkDefault {
#    mutableUsers = false;
#  };
}
