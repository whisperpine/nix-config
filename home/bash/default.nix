{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      ls = "eza";
    };
    # .bashrc
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
  };
}
