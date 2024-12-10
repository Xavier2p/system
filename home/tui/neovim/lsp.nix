{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      clangd.enable = true;
      bashls.enable = true;
      markdown_oxide.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      ts_ls.enable = true;
      terraformls.enable = true;
      ansiblels.enable = true;
      sqls = {
        enable = true;
        settings = {
          command = "sqls";
          connections = [
            {
              driver = "postgresql";
              dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=roger_roger sslmode=disable";
              alias = "sql-workshop";
            }
          ];
        };
      };
      gitlab_ci_ls = {
        enable = true;
        package = pkgs.gitlab-ci-ls;
      };
    };
  };

  home.packages = with pkgs; [ansible-language-server gitlab-ci-ls];
}
