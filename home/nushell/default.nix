{ ... }:
# --- nushell configs --- #
{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
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
    };
  };
}
