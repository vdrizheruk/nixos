{ pkgs, ... }:
{
  console = {
    font = "ter-v14n";
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.ntp = {
    enable = true;
  };

  services.chrony = {
    enable = true;
    extraConfig = ''
      bindcmdaddress 127.0.0.1
      makestep 1 -1
    '';
    extraFlags = [ "-4" ];
    servers = [
      "0.pool.ntp.org"
      "1.pool.ntp.org"
      "ntp2.stratum1.ru"
      "ntp3.stratum2.ru"
    ];
  };

  time = {
    timeZone = "UTC";
    hardwareClockInLocalTime = false;
  };
}
