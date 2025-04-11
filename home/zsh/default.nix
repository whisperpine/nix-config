{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
    };
    # .zprofile
    profileExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin"
    '';
  };
}
