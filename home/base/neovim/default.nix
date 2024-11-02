{ ... }:
{
  programs.neovim = {
    enable = true;
  };
  xdg.configFile.nvim = {
    enable = true;
    recursive = true;
    source = ./nvim;
  };
}
