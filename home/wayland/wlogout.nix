{
  config,
  lib,
  ...
}: let
  cfg = config.wlogout;
in {
  options = {
    wlogout.enable = lib.mkEnableOption "Wlogout Power Menu";
  };

  config = lib.mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
        }
        {
          "label" = "logout";
          "action" = "hyprctl dispatch exit";
          "text" = "Exit";
          "keybind" = "e";
        }
        {
          "label" = "lock";
          "action" = "hyprlock";
          "text" = "Lock";
          "keybind" = "l";
        }
        {
          "label" = "suspend";
          "action" = "systemctl suspend";
          "text" = "Suspend";
          "keybind" = "u";
        }
        {
          "label" = "hibernate";
          "action" = "systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
        }
      ];
      style = ''
        * {
          background-image: none;
          transition: 20ms;
        }
        window {
          background-color: rgba(12, 12, 12, 0.1);
        }
        button {
          font-size:20px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          border-style: solid;
          background-color: rgba(12, 12, 12, 0.3);
          border: 3px solid;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        button:focus, button:active, button:hover {
          background-color: rgba(12, 12, 12, 0.5);
          border: 3px solid;
        }
        #logout {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/logout.png"));
        }
        #suspend {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/suspend.png"));
        }
        #shutdown {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/shutdown.png"));
        }
        #reboot {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/reboot.png"));
        }
        #lock {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/lock.png"));
        }
        #hibernate {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("icons/hibernate.png"));
        }
      '';
    };
  };
}
