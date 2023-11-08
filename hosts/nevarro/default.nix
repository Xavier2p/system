#  Specific system configuration settings for `nevarro`
#
#  flake.nix
#   ├─ hosts/
#   │   ├─ default.nix
#   │   └─ nevarro/
#   │        ├─ default.nix *
#   │        └─ hardware.nix
#   └─ pkgs/
#       └─ docker.nix


{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];
}
