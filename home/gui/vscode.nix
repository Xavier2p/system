{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.vscode;
in {
  options = {
    vscode.enable = lib.mkEnableOption "Visual Studio Code";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;

      userSettings = {
        files.autoSave = "off";

        workbench.startupEditor = "none";
        workbench.iconTheme = "material-icon-theme";

        editor.rulers = [80 120 160];
        editor.tabSize = 2;
        editor.formatOnSave = true;

        explorer.confirmDelete = false;
        explorer.confirmDragAndDrop = false;
        window.menuBarVisibility = "hidden";

        update.showReleaseNotes = false;
      };

      extensions = with pkgs.vscode-extensions; [
        hashicorp.terraform
        pkief.material-icon-theme
        github.copilot
        github.copilot-chat # azemoh.one-monokai
        esbenp.prettier-vscode
      ];
    };
  };
}
