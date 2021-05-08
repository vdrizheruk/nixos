{ lib, ... }:
{
  services.unbound = with lib; {
    enable = mkDefault true;
    allowedAccess = [ "127.0.0.0/8" ];
    interfaces = [ "127.0.0.1" ];
    extraConfig = ''
      verbosity: 0
      num-threads: 2
      cache-min-ttl: 300
      cache-max-ttl: 14400
      do-ip4: yes
      do-ip6: no
      hide-identity: yes
      hide-version: yes
      harden-glue: yes
      harden-dnssec-stripped: yes
      harden-referral-path: yes
      use-caps-for-id: yes
      qname-minimisation: yes
      prefetch: yes
      prefetch-key: yes
      rrset-roundrobin: yes
      minimal-responses: yes
      serve-expired: yes
      remote-control:
        control-enable: yes
        control-interface: 127.0.0.1
        control-port: 8953
        control-use-cert:no
    '';
  };
}
