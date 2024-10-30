{ pkgs, ... }:
{
  programs.nushell = {
    enable = true;
    envFile.source = ./env.nu;
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
