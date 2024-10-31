{ lib, config, pkgs, ... }:

# this file must be splitted in one file per program

{
  options = {
    shelltools.enable = lib.mkEnableOption "Shell Tools Module";
  };

  config = lib.mkIf config.shelltools.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "Dracula";
        italic-text = "always";
      };
    };
    programs.fastfetch = {
      enable = true;

      settings = {
        display = {
          color = {
            keys = "35";
            output = "90";
          };
        };


        modules = [
          "break"
          {
            type = "custom";
            format = "┌──────────────────────Hardware──────────────────────┐";
          }
          {
            type = "cpu";
            key = "│  ";
          }
          {
            type = "gpu";
            key = "│ 󰍛 ";
          }
          {
            type = "memory";
            key = "│ 󰑭 ";
          }
          {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "custom";
            format = "┌──────────────────────Software──────────────────────┐";
            }
            {
            type = "custom";
            format = " OS -> ZaneyOS 2.2";
            }
            {
            type = "kernel";
            key = "│ ├ ";
            }
            {
            type = "packages";
            key = "│ ├󰏖 ";
            }
            {
            type = "shell";
            key = "└ └ ";
            }
            "break"
            {
            type = "wm";
            key = " WM";
            }
            {
            type = "wmtheme";
            key = "│ ├󰉼 ";
            }
            {
            type = "terminal";
            key = "└ └ ";
            }
            {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
            }
            "break"
            {
            type = "custom";
            format = "┌────────────────────Uptime / Age────────────────────┐";
            }
            {
            type = "command";
            key = "│  ";
            text = #bash
            ''
            birth_install=$(stat -c %W /)
            current=$(date +%s)
            delta=$((current - birth_install))
            delta_days=$((delta / 86400))
            echo $delta_days days
            '';
            }
            {
            type = "uptime";
            key = "│  ";
            }
            {
            type = "custom";
            format = "└────────────────────────────────────────────────────┘";
            }
            "break"
            ];
            };
            };

            };
            }
