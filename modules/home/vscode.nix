{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;
    userSettings = {
      files.auoSave = "off";
      workbench.startupEditor = "none";
    };
  };
}
