{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.tui;
in {
  imports = [
    # ./apps
    ./neovim
    ./shell
    ./tools
  ];

  options.tui.enable = lib.mkEnableOption "Enable TUI programs";

  config = lib.mkIf cfg.enable {
    nvim.enable = lib.mkDefault true;
    forgeOS.shell.enable = lib.mkDefault true;
    forgeOS.tools.enable = lib.mkDefault true;
    forgeOS.tools.enableEssentialTools = lib.mkDefault true;

    # TEMPORARY
    forgeOS.tools.enableExtendedTools = lib.mkDefault true;
    forgeOS.tools.oxydize = lib.mkDefault true;
  };
}
