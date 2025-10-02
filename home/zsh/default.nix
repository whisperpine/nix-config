{ ... }:
{
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    enableCompletion = true;
    autosuggestion.enable = true;
    envExtra = builtins.readFile ./.zshenv;
    initContent = builtins.readFile ./.zshrc;
    profileExtra = builtins.readFile ./.zprofile;
    shellAliases = {
      ap = "ansible-playbook";
      av = "ansible-vault";
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      e = "eza";
      el = "eza -l";
    };
  };
}
