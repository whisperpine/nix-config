{ ... }:
# --- terminal file manager --- #
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile.yazi.source = ../yazi;
}
