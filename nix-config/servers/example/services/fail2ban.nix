{
  services.fail2ban = {
    enable = true;
    jails = {
      sshd = ''
        enabled  = true
      '';
    };
  };
}
