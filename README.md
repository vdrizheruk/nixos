# nixos configuration

nixos configuration, located in /etc/nixos.

## How to configure

```bash
sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixos-unstable
sudo nix-channel --add https://nixos.org/channels/nixos-20.03 nixos-legacy
sudo nix-channel --update
```

## How to aply changes

```bash
sudo nixos-rebuild switch
```

## How to cleanup system

```bash
sudo nix-collect-garbage -d
```
