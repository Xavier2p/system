{
  program.zsh.shellAliases = {
    ls = "lsd";
    ll = "lsd -l";
    la = "lsd -A";
    lal = "lsd -lA";
    l = "lsd -l";
    nixos-rebuild = "pushd $NIX_CONFIG_DIR && sudo darwin-rebuild --flake switch && popd";
  };
}
