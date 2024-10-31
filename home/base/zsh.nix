{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      z = "zellij attach";
    };
    # .zprofile
    profileExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin"
    '';
  };
}
