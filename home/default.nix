{lib, ...}: {
  imports = [
    ./apps
    ./desktop
    ./neovim
    ./shell
    ./tools
  ];

  config = {
    forgeOS.apps.enable = lib.mkDefault true;
    forgeOS.apps.enableTUIApps = lib.mkDefault true;

    nixpkgs.config.allowUnfree = true;
    programs.home-manager.enable = true;

    nvim.enable = lib.mkDefault true;
    forgeOS.shell.enable = lib.mkDefault true;
    forgeOS.tools.enable = lib.mkDefault true;
    forgeOS.tools.enableEssentialTools = lib.mkDefault true;

    # TEMPORARY
    forgeOS.tools.enableExtendedTools = lib.mkDefault true;
    forgeOS.tools.oxydize = lib.mkDefault true;
    forgeOS.apps.enableGUIApps = lib.mkDefault true;
    forgeOS.desktop.enable = lib.mkDefault false;

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
  };
}
