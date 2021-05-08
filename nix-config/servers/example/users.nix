{ config, ... }:
let
  ssh-keys = import ./../../generic/security/ssh-keys.nix;

in {
  users = with ssh-keys; {
    users.root = {
      hashedPassword = null;
    };
    users.rebrain = {
      isNormalUser = true;
      uid = config.uid-gid.rebrain;
      group = "rebrain";
      extraGroups = [ "wheel" "users" ];
      openssh.authorizedKeys.keys = [
        work.rebrain_example
      ];
      hashedPassword = "_generated_hash_pass_";
    };

    groups.rebrain = {
      gid = config.uid-gid.rebrain;
    };

    groups.ssh-users = {
      members = [ "rebrain" ];
    };
  };
}
