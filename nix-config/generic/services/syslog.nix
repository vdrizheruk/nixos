{ config, lib, ... }:

with lib;

{
  systemd.services.syslog-ng = {
    preStart = ''
      test -d "/var/log/sshd" || mkdir -p /var/log/sshd
      test -d "/var/log/sshd/backup" || mkdir -p /var/log/sshd/backup
      test `stat -c %a:%U:%G /var/log/sshd` = "750:root:wheel" || (chmod 750 /var/log/sshd && chown root:wheel /var/log/sshd)
      test `stat -c %a:%U:%G /var/log/sshd/backup` = "750:root:wheel" || (chmod 750 /var/log/sshd/backup && chown root:wheel /var/log/sshd/backup)
    '';
  };

  services.syslog-ng = {
    enable = mkDefault true;
    extraConfig = ''
      source src { system(); internal(); };
      destination authlog {
        file("/var/log/sshd/auth.log" create_dirs(no)
        dir_owner("root") dir_group("wheel") dir_perm(0750)
        owner("root") group("wheel") perm(0640));
      };
      filter f_auth { facility(authpriv); };
      log { source(src); filter(f_auth); destination(authlog); };
    '';
  };
}
