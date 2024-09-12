{ pkgs, ... } @ inputs:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;
      scan_timeout = 10;
      right_format = "$cmd_duration$jobs";
      format = "$username$hostname$localip$os$directory$git_branch$git_commit$git_status$container$c$rust$golang$python$nodejs$java$php$dotnet$elixir$erlang$gcloud$kubernetes$aws$package$docker_context$terraform$fill$memory_usage
$nix_shell$sudo$character";
      continuation_prompt = "➜";
      palette = "main";

      palettes.main = {
        blue = "21";
        cyan = "51";
        green = "118";
        red = "196";
        orange = "208";
        drawings = "001";
      };

      battery.disabled = true;

      c = {
        format = "[$symbol]($style) ";
        symbol = "C";
        style = "bold blue";
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
        vimcmd_symbol = "[](blue)";
        vimcmd_replace_one_symbol = "[](orange)";
        vimcmd_replace_symbol = "[](red)";
        vimcmd_visual_symbol = "[](purple)";
      };

      cmd_duration = {
        min_time = 500;
        # format = "[\[](drawings)[$duration]($style)[\]─](drawings)"
        format = " [$duration]($style)";
        style = "bold yellow";
        show_milliseconds = false;
      };

      container.format = "[$symbol \[$name\]]($style) ";

      directory = {
        format = "[ $path]($style)[$read_only]($read_only_style) ";
        truncation_length = 3;
      };

      docker_context = {
        format = "[\[$symbol $context\] ]($style) ";
        symbol = "";
      };

      fill = {
        symbol = " ";
        disabled = false;
      };

      git_branch = {
        format = "on [$symbol git::$branch]($style)";
        symbol = "";
        style = "bold yellow";
      };

      git_commit = {
        format = " commit: [$hash$tag]($style)";
        style = "bold yellow";
        tag_symbol = " ";
        tag_disabled = false;
      };

      git_metrics = {
        added_style = "bold green";
        deleted_style = "bold red";
        only_nonzero_diffs = true;
        format = "[+$added]($added_style)[-$deleted]($deleted_style) ";
        disabled = false;
      };

      git_status = {
        format = "[$all_status$ahead_behind]($style) ";
        style = "bold yellow";
      };

      hostname = {
        ssh_only = true;
        format = " on [$hostname]($style)";
        style = "bold green";
      };

      jobs = {
        format = " [\[$number\]]($style)";
        style = "orange";
        number_threshold = 1;
      };

      localip = {
        ssh_only = true;
        disabled = false;
        format = " [\[$localipv4\]]($style)
        ";
        style = "bold blue";
      };

      memory_usage = {
        disabled = false;
        format = "[\[$symbol$ram\($ram_pct\)\]]($style)";
        threshold = 75;
        symbol = " ";
        style = "bold dimmed green";
      };

      nix_shell = {
        format = "[$symbol$state-$name]($style) ";
        symbol = " ";
        style = "bold blue";
      };

      nodejs = {
        format = "[$symbol]($style) ";
        symbol = "";
        version_format = "v\${major}";
        style = "bold green";
      };

      os = {
        format = "[$symbol ]($style)";
        style = "bold white";
        disabled = false;
      };

      os.symbols = {
        Windows = "";
        Linux = "";
        Macos = "";
        Raspbian = "";
        Debian = "";
        Ubuntu = "";
        Arch = "";
        Manjaro = "";
        Fedora = "";
        CentOS = "";
        Alpine = "";
        NixOS = "";
        Redhat = "";
      };

      package = {
        disabled = false;
        format = "[\[$symbol$version\]]($style) ";
        style = "dimmed orange";
        version_format = "\${raw}";
        symbol = " ";
        display_private = true;
      };

      python = {
        format = "[$symbol$virtualenv]($style) ";
        symbol = " ";
        style = "bold blue";
      };

      rust = {
        format = "[$symbol]($style) ";
        symbol = "";
        style = "bold orange";
      };

      shell = {
        format = "[$indicator]($style) ";
        style = "bold green";
        disabled = true;
      };

      status = {
        disabled = false;
        format = "[$symbol$status]($style) ";
      };

      sudo = {
        format = "[$symbol]($style) ";
        symbol = "#";
        style = "bold red";
        disabled = false;
      };

      terraform = {
        format = "[$symbol$workspace]($style) ";
        symbol = "󱁢 ";
        style = "bold 105";
        disabled = false;
        version_format = "v\${raw}";
      };

      time = {
        format = "[\[](drawings)[$time]($style)[\]](drawings)";
        style = "bold orange";
        disabled = false;
        time_format = "%a %d-%H:%M";
      };

      username = {
        format = "[$user]($style)";
        style_user = "bold orange";
        style_root = "bold red";
      };
    };
  };
}
