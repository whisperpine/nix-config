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
      e = "eza";
      el = "eza -l";
    };
    # .bashrc
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
      export PATH="$PATH:/etc/nixos/scripts/"
    '';
  };
}
