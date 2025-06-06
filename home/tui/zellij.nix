{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.zellij;
  za = pkgs.writeShellScriptBin "za" ''
    sessions=$(zellij ls | sed "s/\x1B\[[0-9;]*[mGK]//g" | awk '{print $1}')
    selected_session=$(echo "$sessions" | sk --reverse --height 1 --tac)
    if [ -n "$selected_session" ]; then
      zellij attach "$selected_session"
    fi
  '';
in {
  options = {
    zellij.enable = lib.mkEnableOption "Zellij terminal multiplexer";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.shellAliases = {
      z = "zellij";
      zc = "zellij attach --create";
    };
    home.packages = [za];

    programs.zellij = {
      enable = true;
      enableZshIntegration = false;
      package = pkgs.zellij;

      settings = {
        pane_frames = false;
        theme = "night-owl";
        simplified_ui = true;
        default_layout = "compact";
        show_startup_tips = false;
        show_release_notes = false;
        mouse_mode = true;
        ui.pane_frames.rounded_corners = true;

        keybinds.normal = {
          "bind \"Ctrl 1\"".GoToTab._args = [1];
          "bind \"Ctrl 2\"".GoToTab._args = [2];
          "bind \"Ctrl 3\"".GoToTab._args = [3];
          "bind \"Ctrl 4\"".GoToTab._args = [4];
          "bind \"Ctrl 5\"".GoToTab._args = [5];
          "bind \"Ctrl 6\"".GoToTab._args = [6];
          "bind \"Ctrl 7\"".GoToTab._args = [7];
          "bind \"Ctrl 8\"".GoToTab._args = [8];
          "bind \"Ctrl 9\"".GoToTab._args = [9];
        };
      };
    };
  };
}
