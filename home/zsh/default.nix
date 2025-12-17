{ ... }:
# --- zsh configs --- #
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
      ai = "ansible-inventory";
      ad = "ansible-doc";
      ag = "ansible-galaxy";
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      e = "eza";
      el = "eza -l";
      # Todo: this is a temporary solution to lock screen and suspend system.
      sus = "hyprlock -q --no-fade-in & sleep 0.1 && systemctl suspend";
    };
  };
}
