{ ... }:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableNushellIntegration = false;
  };

  xdg.configFile.atuin = {
    source = ./config.toml;
    target = "./atuin/config.toml";
  };
}
