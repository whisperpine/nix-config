{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      ls = "eza";
      ll = "eza -l --icons";
    };
    # .zprofile
    profileExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin"
    '';
  };
}
