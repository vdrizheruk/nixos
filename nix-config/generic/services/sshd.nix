{ lib, ... }:
{
  services.openssh = with lib; {
    enable = true;
    ports = [ 22 ];
    allowSFTP = true;
    forwardX11 = mkDefault false;
    startWhenNeeded = mkDefault true;
    permitRootLogin = mkDefault "yes";
    passwordAuthentication = false;
    challengeResponseAuthentication = false;
    useDns = true;
    logLevel = mkDefault "INFO";

    macs = [ "hmac-sha2-512-etm@openssh.com" ];
    ciphers = [ "chacha20-poly1305@openssh.com" ];
    kexAlgorithms = [ "curve25519-sha256@libssh.org" ];

#    authorizedKeysFiles = mkForce [
#      "/etc/ssh/authorized_keys.d/%u"
#    ];

    hostKeys = [
      { path = "/etc/ssh/ssh_host_ed25519_key"; type = "ed25519"; rounds = 128; }
    ];

    extraConfig = ''
      AllowGroups ssh-users root

      ListenAddress 0.0.0.0
      ClientAliveCountMax 10
      ClientAliveInterval 30
      Compression no
      TCPKeepAlive no

      LoginGraceTime 40
      MaxAuthTries 3
      MaxSessions 500
      MaxStartups 3:30:9
      RekeyLimit 256m 30m

      Banner none
      PrintLastLog yes

      AllowAgentForwarding yes
      AllowTcpForwarding yes
      FingerprintHash sha256
      GSSAPIAuthentication no
      HostbasedAuthentication no
      IgnoreRhosts yes
      KerberosAuthentication no
      PermitEmptyPasswords no
      PermitTTY yes
      PermitTunnel yes
      PermitUserEnvironment yes
      PubkeyAuthentication yes
      StrictModes no

      SyslogFacility AUTHPRIV
    '';
  };
}
