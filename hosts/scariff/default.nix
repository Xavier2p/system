#  Specific system configuration settings for `scariff`
#
#  flake.nix
#   ├─ ./hosts
#   │   ├─ default.nix
#   │   └─ ./scariff
#   │        ├─ default.nix *
#   │        └─ hardware.nix
#   └─ ./pkgs
#       └─ docker.nix


{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];
}
