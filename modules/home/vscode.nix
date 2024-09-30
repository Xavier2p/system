{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    userSettings = {
      files.autoSave = "off";
      workbench.startupEditor = "none";
      editor.rulers = [ 80 120 160 ];
      editor.tabSize = 2;
      editor.formatOnSave = true;
      explorer.confirmDelete = false;
      explorer.confirmDragAndDrop = false;
      update.showReleaseNotes = false;
    };

    extensions = with pkgs.vscode-extensions; [
      hashicorp.terraform
      # azemoh.one-monokai
      pkief.material-icon-theme
      github.copilot
      github.copilot-chat
    ];
  };
}
