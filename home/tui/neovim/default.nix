{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nvim;
in {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./keymapping.nix
    ./lightline.nix
    ./lsp.nix
    ./options.nix
    ./theme.nix
  ];

  options = {
    nvim.enable = lib.mkEnableOption "NeoVIM configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      extraPackages = with pkgs; [
        alejandra
      ];

      defaultEditor = true;
      enableMan = true;
      viAlias = true;

      plugins = {
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            sources = [
              {name = "nvim_lsp";}
              {name = "buffer";}
              {name = "path";}
            ];
          };
        };
        gitgutter = {
          enable = true;
          signs = {
            added = "|";
            modified = "|";
            modifiedRemoved = "±";
            removed = "-";
            removedFirstLine = "ø";
          };
        };
        neo-tree = {
          enable = true;
          closeIfLastWindow = true;
          window = {
            width = 30;
            autoExpandWidth = false;
          };
        };
        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };
        telescope = {
          enable = true;
        };
        web-devicons.enable = true;
        rainbow-delimiters.enable = true;
        fugitive.enable = true;
        copilot-vim.enable = true;
        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              timeout_ms = 1000;
              lsp_format = "fallback";
            };
            formatters_by_ft = {
              nix = ["alejandra"];
              cpp = ["clang-format"];
              c = ["clang-format"];
            };
          };
        };
      };
    };
  };
}
