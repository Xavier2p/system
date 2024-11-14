{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 4;
    tabstop = 4;
    expandtab = true;
    autoindent = true;
    mouse = "";
    list = true;
    listchars = "tab:>─,eol:¬";

    colorcolumn = "80";
    cursorline = true;
    updatetime = 100;
  };
}
