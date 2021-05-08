{
  boot.kernelModules = [ "nft_reject" ];

  networking = {
    firewall.enable = false;
    nftables.enable = true;
    nftables.ruleset = ''
      table inet filter {
        chain checks-base {
          ct state invalid drop
          ct state {established, related} accept
        }
        chain input {
          type filter hook input priority 0; policy drop;
          jump checks-base
          iif "lo" notrack accept
          ip protocol icmp icmp type { echo-request} ct state new accept
          tcp dport { 22 } ct state new accept
        }
        chain output {
          type filter hook output priority 0; policy accept;
          jump checks-base
          oif "lo" notrack accept
        }
        chain forward {
          type filter hook forward priority 0; policy drop;
          jump checks-base
        }
      }
    '';
  };
}
