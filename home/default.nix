{lib, ...}: {
  imports = [
    ./apps
    ./tui
    ./desktop
  ];

  forgeOS.apps.enable = lib.mkDefault true;
  forgeOS.apps.enableTUIApps = lib.mkDefault true;
  forgeOS.apps.enableGUIApps = lib.mkDefault true;
  tui.enable = lib.mkDefault true;
  forgeOS.desktop.enable = lib.mkDefault false;

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.05";
    file = {
      ".config/nixpkgs/config.nix".text = ''
        {
          allowUnfree = true;
          allowBroken = false;
        }
      '';
    };
  };
}
