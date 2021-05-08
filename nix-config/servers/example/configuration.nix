{
  imports =[
    ./../../core.nix
    ./services/fail2ban.nix
    ./services/firefall-nft.nix
    ./users.nix
  ];

  boot = {
    loader.grub.enable = true;
    loader.grub.version = 2;
    loader.grub.device = "/dev/sda";
  };

  networking.hostName = "nixos";

  # Set your time zone.
  time.timeZone = "UTC";


}
