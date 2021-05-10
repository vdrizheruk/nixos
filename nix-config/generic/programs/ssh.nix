{
  programs.ssh = {
    startAgent = true;
    extraConfig = ''
      AddressFamily inet
      ConnectTimeout 60
      ServerAliveCountMax 10
      ServerAliveInterval 30
      Compression no
      TCPKeepAlive no

      RekeyLimit 256m 30m

      ChallengeResponseAuthentication no
      FingerprintHash sha256
      GSSAPIAuthentication no
      HostbasedAuthentication no
      PasswordAuthentication yes
      PreferredAuthentications publickey,password
      PubkeyAuthentication yes

      BatchMode no
      CheckHostIP yes
      ControlMaster no
      ForwardAgent yes
      ForwardX11 yes
      ForwardX11Trusted yes
      HashKnownHosts no
      StrictHostKeyChecking ask
      UpdateHostKeys yes

#      IdentitiesOnly yes
#      IdentityFile ~/.ssh/id_ed25519
      UserKnownHostsFile ~/.ssh/known_hosts
      GlobalKnownHostsFile /etc/ssh/ssh_known_hosts
    '';
  };
}
