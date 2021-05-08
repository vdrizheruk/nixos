{ config, ... }:
let
  ssh-keys = import ./../../generic/security/ssh-keys.nix;

in {
  users = with ssh-keys; {
#    users.root = {
#      hashedPassword = null;
#    };
    users.developer = {
      isNormalUser = true;
      uid = config.uid-gid.developer;
      group = "developer";
      extraGroups = [ "wheel" "users" ];
      openssh.authorizedKeys.keys = [
        work.developer
      ];
      hashedPassword = "_generated_hash_pass_";
    };

    groups.developer = {
      gid = config.uid-gid.developer;
    };

    groups.ssh-users = {
      members = [ "developer" ];
    };
  };
}
