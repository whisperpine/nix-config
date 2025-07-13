{ pkgs-stable, ... }:
{
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    shellAliases = {
      za = "zellij attach";
      kc = "kubectl";
      lg = "lazygit";
      vim = "nvim";
      e = "eza";
      el = "eza -l";
    };

    # This is a workaround for the conflict with direnv's hook.
    package = pkgs-stable.nushell;
  };
}
