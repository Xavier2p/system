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
      metals.enable = true;
      gitlab_ci_ls = {
        enable = true;
        package = pkgs.gitlab-ci-ls;
      };
    };
  };

  home.packages = with pkgs; [ansible-language-server gitlab-ci-ls];
}
