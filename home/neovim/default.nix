{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ./init.vim;
    plugins = with pkgs.vimPlugins; [
      vim-better-whitespace
      vim-commentary
      lightline-vim
      vim-surround
      indentLine
      targets-vim
    ];
  };
}
