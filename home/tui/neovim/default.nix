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
    ./theme.nix
    ./options.nix
    ./lightline.nix
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
            added = "+";
            modified = "~";
            modifiedRemoved = "±";
            removed = "-";
            removedFirstLine = "ø";
          };
        };
        lsp = {
          enable = true;
          servers = {
            nixd.enable = true;
            clangd.enable = true;
            bashls.enable = true;
            rust_analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
            };
            ts_ls.enable = true;
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
