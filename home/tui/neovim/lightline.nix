{
  programs.nixvim.plugins.lightline = {
    enable = true;
    settings = {
      colorscheme = "wombat";
      active = {
        left = [
          ["mode" "paste"]
          ["gitbranch" "readonly" "filename" "modified"]
        ];
        right = [
          ["lineinfo"]
          ["percent"]
          ["fileformat" "fileencoding" "filetype" "charvaluehex"]
        ];
      };
      component_function = {
        gitbranch = "FugitiveHead";
      };
      component = {
        charvaluehex = "0x%B";
      };
    };
  };
}
