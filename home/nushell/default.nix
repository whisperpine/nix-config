{ ... }:
{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    shellAliases = {
      z = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      vi = "nvim";
    };
  };
}
