{ pkgs, ... }:

{
  programs.i3status = {
    enable = true;
    general = {
      output_format = "i3bar";
      colors = true;
      separator = "|";
      interval = 5;
    };
    modules = {
      "tztime local" = {
        enable = true;
        position = 9;
        settings = {
          format = "%Y-%m-%d::%H:%M:%S";
        };
      };
      "ipv6" = {
        enable = false;
      };
      "disk /" = {
        enable = true;
        position = 7;
        settings = {
          format = "%avail";
        };
      };
      "wireless _first_" = {
        enable = true;
        position = 1;
        settings = {
          format_up = "%essid::%ip (%quality)";
          format_down = "W::down";
        };
      };
      "ethernet _first_" = {
        enable = true;
        position = 2;
        settings = {
          format_up = "E::%ip (%speed)";
          format_down = "E::down";
        };
      };
     "memory" = {
        enable = true;
        position = 5;
        settings = {
          format = "M::%used (%percentage_used)";
          threshold_degraded = "2G";
          format_degraded = "M::%free!!";
        };
      };
      "cpu_usage" = {
        enable = true;
        position = 4;
        settings = {
          format = "CPU::%usage";
          max_threshold = 75;
          format_above_threshold = "CPU::%usage!!";
          degraded_threshold = 25;
          format_above_degraded_threshold = "CPU::%usage!";
        };
      };
      "cpu_temperature 0" = {
        enable = true;
        position = 3;
        settings = {
          format = "T::%degrees°";
          max_threshold = 50;
          format_above_threshold = "T::%degrees°!!";
        };
      };
      "load" = {
        enable = false;
        position = 6;
        settings = {
          format = "L::%1min";
        };
      };
      "battery all" = {
        enable = true;
        position = 8;
        settings = {
          format = "%status::%percentage";
          format_down = "";
          low_threshold = 25;
          threshold_type = "percentage";
        };
      };
    };
  };
}
