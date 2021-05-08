{ pkgs, lib, ... }:

with lib;

{
  boot.kernelModules = [ "xt_multiport" "ipt_REJECT" ];

  services.fail2ban = {
    enable = mkDefault false;
    package = pkgs.fail2ban;
    packageFirewall = pkgs.nftables;
    banaction = "nftables-multiport";
    banaction-allports = "nftables-allport";
    bantime-increment.enable = true;
    ignoreIP = [ "192.168.0.0/16" ];
    daemonConfig = ''
      [Definition]
      loglevel     = INFO
      logtarget    = SYSLOG
      socket       = /run/fail2ban/fail2ban.sock
      pidfile      = /run/fail2ban/fail2ban.pid
      dbfile       = /var/lib/fail2ban/fail2ban.sqlite3
    '';
    jails = {
      sshd = ''
        maxretry = 3
        mode     = aggressive
      '';
    };
  };
}
