{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {};
  legacy = import <nixos-legacy> {};

  php72 = pkgs.legacy.php72.buildEnv { extensions = { all, ... }: with all; [ imagick opcache ]; extraConfig = "memory_limit = 2048M"; };
  php73 = pkgs.php73.buildEnv { extensions = { all, ... }: with all; [ imagick opcache ]; extraConfig = "memory_limit = 2048M"; };
  php74 = pkgs.php74.buildEnv { extensions = { all, ... }: with all; [ imagick opcache ]; extraConfig = "memory_limit = 2048M"; };
#  unstable.php80 = pkgs.unstable.php80.buildEnv { extraConfig = "memory_limit = 4G"; };
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
    php74Extensions.gd php74Extensions.zip php74Extensions.xsl php74Extensions.xml php74Extensions.pdo
    php74Extensions.pcs php74Extensions.gmp php74Extensions.ftp php74Extensions.ffi php74Extensions.dom
    php74Extensions.dba php74Extensions.bz2 php74Extensions.ast php74Extensions.zlib php74Extensions.yaml
    php74Extensions.tidy php74Extensions.soap php74Extensions.snmp php74Extensions.ldap
    php74Extensions.json php74Extensions.intl php74Extensions.imap php74Extensions.exif php74Extensions.curl
    php74Extensions.bz2 php74Extensions.shmop php74Extensions.redis php74Extensions.posix php74Extensions.pgsql
    php74Extensions.pcntl php74Extensions.iconv php74Extensions.event php74Extensions.ctype php74Extensions.xmlrpc
    php74Extensions.xdebug php74Extensions.mysqli php74Extensions.filter php74Extensions.bcmath


  ];
}
