{
  programs.ssh.knownHosts = {
    "gitlab.com" = {
      hostNames = [ "gitlab.com" "35.231.145.151" ];
      publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNsq+A8J15k3aHaEM6yVsbjYX4ZynRMYsSl0y/1L2EJwzKgHPvui/2vS0DFT+wsjeS/aFrRTPIN4Ppw+K27oVxG3qYlE7kO91pkzsztRJocMP06VXarNMjVD2ucd9/8Qp1+cfivTFzwMkawzL9V1Rd6M7KnZyJjtUUxPy/6V26YJJ4RpglwdCimBp6RfzMGu3EyHa5ucgRARIrglNSriQ8WPi7GzCAB/hVju10bftqqee2fno64GK6GOPl48teHsnN/DvXw+G9y+0zNpKdLDa3k5F5ihv+VUzuxlcVNUnRWogwJXuUJmtoYyeYjZVIbxXmTU5gdVDyYDs2kme6qoJFA5WdXGXAry0ini6L4DhrnVLYxAHURip63gRdjj2jslKlRidESbEi3f8aKpZqGeSJMRzxMdsxIFpRHGiBpo1GygAODoDjHgqIf0/50D/nhidXGZMAdnt3qNcUW4tVbsbKnNObbnM1GxdUeK6DCiJIm1QdLx1+AwoOzMYl3NVEn88= root@nixos"; };

    "whoami.filippo.io" = {
      hostNames = [  "whoami.filippo.io" "178.32.139.168" ];
      publicKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDNsq+A8J15k3aHaEM6yVsbjYX4ZynRMYsSl0y/1L2EJwzKgHPvui/2vS0DFT+wsjeS/aFrRTPIN4Ppw+K27oVxG3qYlE7kO91pkzsztRJocMP06VXarNMjVD2ucd9/8Qp1+cfivTFzwMkawzL9V1Rd6M7KnZyJjtUUxPy/6V26YJJ4RpglwdCimBp6RfzMGu3EyHa5ucgRARIrglNSriQ8WPi7GzCAB/hVju10bftqqee2fno64GK6GOPl48teHsnN/DvXw+G9y+0zNpKdLDa3k5F5ihv+VUzuxlcVNUnRWogwJXuUJmtoYyeYjZVIbxXmTU5gdVDyYDs2kme6qoJFA5WdXGXAry0ini6L4DhrnVLYxAHURip63gRdjj2jslKlRidESbEi3f8aKpZqGeSJMRzxMdsxIFpRHGiBpo1GygAODoDjHgqIf0/50D/nhidXGZMAdnt3qNcUW4tVbsbKnNObbnM1GxdUeK6DCiJIm1QdLx1+AwoOzMYl3NVEn88= root@nixos"; };
  };
}
