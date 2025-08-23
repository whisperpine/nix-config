{ ... }:
{
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    enableCompletion = true;
    autosuggestion.enable = true;
    profileExtra = "${builtins.readFile ./.zprofile}";
    initContent = builtins.readFile ./.zshrc;
    shellAliases = {
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      e = "eza";
      el = "eza -l";
    };
  };
}
