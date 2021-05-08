{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  environment.defaultPackages = with pkgs; [
    nano perl rsync strace
    binutils file lsof sysstat
    dcfldd gpart parted
    dar duf htop mc tree
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
  ];
}
