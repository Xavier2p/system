{
  config,
  lib,
  ...
}: let
  cfg = config.forgeOS.tools.git;
  epitaConfig = {
    name = "Xavier de Place";
    email = "xavier.de-place@epita.fr";
    signingkey = "~/.ssh/epita.pub";
  };
  ghConfig = {
    name = "Xavier2p";
    email = "git@Xavier2p.fr";
    signingkey = "~/.ssh/gh-sign.pub";
  };
in {
  options.forgeOS.tools.git = {
    enable = lib.mkEnableOption "Enable git";
    addAlias = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Use git command aliases";
    };
  };

  config = lib.mkIf cfg.enable {
    programs = lib.mkMerge [
      (lib.mkIf cfg.addAlias {zsh.shellAliases.g = "git";})

      {
        delta = {
          enable = true;
          enableGitIntegration = true;
          options = {
            line-numbers = true;
            side-by-side = true;
          };
        };

        git = {
          enable = true;

          includes = [
            {
              condition = "hasconfig:remote.*.url:xavier.de-place@git.forge.epita.fr:*/**";
              contents.user = epitaConfig;
            }
            {
              condition = "hasconfig:remote.*.url:git@gitlab.cri.epita.fr:*/**";
              contents.user = epitaConfig;
            }
            {
              condition = "hasconfig:remote.*.url:git@gitlab.alpes.si:*/**";
              contents.user = {
                name = "PEX";
                email = "REDACTED";
                signingkey = "~/.ssh/gh-sign.pub";
              };
            }
            {
              condition = "hasconfig:remote.*.url:git@github.com:*/**";
              contents.user = ghConfig;
            }
            {
              condition = "hasconfig:remote.*.url:gh:*/**";
              contents.user = ghConfig;
            }
          ];

          lfs.enable = true;

          settings = {
            gpg.format = "ssh";
            core = {
              compression = 9;
              whitespace = "error";
            };
            advices = {
              addEmptyPathspec = false;
              pushNonFastForward = false;
              statusHints = false;
            };
            status = {
              branch = true;
              short = true;
              showStash = true;
              showUntrackedFiles = "all";
            };
            init.defaultBranch = "master";
            color.ui = true;
            commit.gpgSign = true;
            push = {
              autoSetupRemote = true;
              default = "current";
            };
            pull.default = "current";

            url = {
              "git@github.com:".insteadOf = "gh:";
              "git@gitlab.cri.epita.fr:".insteadOf = "glcri:";
            };

            alias = {
              a = "add";
              aa = "add --all";
              au = "add --update";
              b = "branch";
              bm = "branch -M main";
              cm = "commit -m";
              l = "log --all --oneline --graph --decorate";
              ls = "ls-files";
              t = "tag -ma";
              pft = "push --follow-tags";
              pl = "pull";
              st = "status";
              sw = "switch";
            };
          };

          ignores = [
            "__pycache__/"
            ".DS_Store"
            ".env*"
            "*.exe"
            ".idea/"
            ".vscode/"
            "*.d"
            "*.local"
            "*.o"
            "*.swp"
            "dist/"
            "node_modules/"
            "secrets/"
            "target/"
            "*.out"
            ".direnv/"
          ];
        };
      }
    ];
  };
}
