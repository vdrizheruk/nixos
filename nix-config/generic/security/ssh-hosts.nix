{
  programs.ssh.knownHosts = {
    "github.com" = {
      hostNames = [ "github.com" "192.30.253.112" "192.30.253.113" "140.82.113.3" "140.82.113.4" "140.82.114.3" "140.82.114.4" "140.82.118.3" "140.82.118.4" ];
      publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="; };

    "gitlab.com" = {
      hostNames = [ "gitlab.com" "35.231.145.151" ];
      publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAfuCHKVTjquxvt6CM6tdG4SLp1Btn/nOeHHE5UOzRdf"; };

    "whoami.filippo.io" = {
      hostNames = [  "whoami.filippo.io" "178.32.139.168" ];
      publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtytJXz8x5gaNC/qj/Gaz0Sp44zsu/SZ+vPjks3RgNLWpgTkUf3ppQjYWpl9R95m19VjMapOY8DNhpnOyp9uQRSrA7VoytJd4Csq+uISi3RTu3goRqW1+Ta3311aDq3W2IxBpGLMgm6pO/gB+WtDmlJ0xlz9SA5Snx7+MYDAya+Mw/BYBTy6qSRAgtcKEGQjlG+sOhD1H0jM7GNeYwExNeEPW1VgEcFuLSBNK8VzcwkdCovpbaVgx3FAdlUz1Q1Go4MOKgiGNtX64CslcOkK5B6cBm4GDqgHIJW6Hjo6n6dzz78PF6ngzqZp9TpWoN/Tvw8pEmvSx9L/HOLRDxzHkF"; };
  };
}
