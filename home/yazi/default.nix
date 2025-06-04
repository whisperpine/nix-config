{ ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };
  xdg.configFile.yazi.source = ../yazi;
}
