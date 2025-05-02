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
      e = "eza";
      el = "eza -l";
    };
    # .zprofile
    profileExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin"
      export PATH="$PATH:/etc/nixos/scripts/"
    '';
  };
}
