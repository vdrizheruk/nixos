{ lib, ... }:
{
  options = with lib; {
    uid-gid = mkOption {
      internal = true;
    };
  };

  config = {
    uid-gid = {
      developer   = 51011;

      web-nginx = 21010;
      web-httpd = 21020;

      web-php01 = 22031;
      web-php02 = 22032;
      web-php03 = 22033;
      web-php04 = 22034;
      web-php05 = 22035;
      web-php06 = 22036;
      web-php07 = 22037;
      web-php08 = 22038;

      web-sftp  = 23010;

      www-data  = 32000;

      www-us11  = 51101;
      www-us12  = 51102;
      www-us13  = 51103;
      www-us14  = 51104;
      www-us15  = 51105;
      www-us16  = 51106;
      www-us17  = 51107;
      www-us18  = 51108;
    };
  };
}
