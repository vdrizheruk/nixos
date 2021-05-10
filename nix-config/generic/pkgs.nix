{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  legacy = import <nixos-legacy> {};
  php74 = pkgs.php74.buildEnv { extraConfig = "memory_limit = 2G"; };
in
{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  environment.etc = with pkgs; {
    "php73".source = php73;
    "php74".source = php74;
    "php80".source = unstable.php80;
    "php72".source = legacy.php72;
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;

  environment.defaultPackages = with pkgs; [
    nano perl rsync strace
    binutils file lsof sysstat
    dcfldd gpart parted
    dar htop mc tree
    git gitAndTools.tig
    tcpdump wget
  ];

  environment.systemPackages = with pkgs; [
    cpufrequtils dmidecode ethtool hddtemp hdparm hwinfo pciutils sdparm sg3_utils smartmontools
    nixops nix-index nix-info nix-review nix-top nix-update nixos-generators dep2nix cachix
    apcupsd ipmiutil
    dosfstools ntfs3g
    breezy mercurial subversion
    gitAndTools.gh gitAndTools.git-trim
    bridge-utils dnsutils inetutils iperf3 mtr tshark speedtest_cli
    libressl testssl ssh-audit
    mydumper sqlite
    ccze lnav multitail
    fio inxi spectre-meltdown-checker
    lego mariadb.client
    wget vim git mc curl lynx wget htop glances zsh
    lxappearance
    docker-compose
    ansible_2_10 ansible-lint
    nodejs-14_x fpm mysql
    legacy.php72 php73 php74 unstable.php80
  ];
}
