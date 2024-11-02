{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    # extraConfig = builtins.readFile ./init.vim;
    plugins = with pkgs.vimPlugins; [
      # vim-better-whitespace
      # gruvbox-material
      # vim-commentary
      # lightline-vim
      # vim-surround
      # indentLine
      # targets-vim
    ];
  };
  xdg.configFile.nvim = {
    enable = true;
    recursive = true;
    source = ./nvim;
  };
}
