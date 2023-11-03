{
  ":q" = "exit";
  l = "lsd -l";
  la = "lsd -A";
  lal = "lsd -lA";
  ll = "lsd -l";
  ls = "lsd";
  nixos-rebuild = "pushd $NIX_CONFIG_DIR && sudo darwin-rebuild --flake switch && popd";
  tf = "terraform";
}
