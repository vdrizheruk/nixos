{ config, lib, ... }:

with lib;

{
  services.logrotate = {
    enable = mkDefault true;
    extraConfig = ''
      olddir backup
      createolddir 0755 root root
      daily
      compress
      delaycompress
      rotate 14
      missingok
      dateext
      dateformat -%Y-%m-%d
      dateyesterday
      datehourago
      nomail
      ifempty
      sharedscripts

      /var/log/sshd/auth.log
      {
        postrotate
          systemctl reload syslog-ng
        endscript
      }
    '';
  };
}
