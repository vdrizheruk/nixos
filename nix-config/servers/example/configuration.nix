{
  imports =[
    ./../../core.nix
    ./services/fail2ban.nix
    ./services/firefall-nft.nix
    ./users.nix
  ];

  boot = {
    loader.grub.device = "/dev/vda";
  };

  networking.hostName = "NixOS-example";
}
