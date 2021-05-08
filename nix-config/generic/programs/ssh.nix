{
  programs.ssh = {
    startAgent = true;
    pubkeyAcceptedKeyTypes = [ "ssh-ed25519" ];
    hostKeyAlgorithms = [ "ssh-ed25519" "rsa-sha2-512" ];
    kexAlgorithms = [ "curve25519-sha256@libssh.org" ];
    ciphers = [ "chacha20-poly1305@openssh.com" ];
    macs = [ "hmac-sha2-512-etm@openssh.com" ];
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
      ForwardAgent no
      ForwardX11 no
      ForwardX11Trusted no
      HashKnownHosts no
      StrictHostKeyChecking ask
      UpdateHostKeys no

      IdentitiesOnly yes
      IdentityFile ~/.ssh/id_ed25519
      UserKnownHostsFile ~/.ssh/known_hosts
      GlobalKnownHostsFile /etc/ssh/ssh_known_hosts
    '';
  };
}
