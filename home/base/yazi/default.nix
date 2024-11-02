{ ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };
  xdg.configFile.yazi = {
    enable = true;
    recursive = true;
    source = ./yazi;
  };
}
