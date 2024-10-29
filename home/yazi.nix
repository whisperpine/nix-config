{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };
}
