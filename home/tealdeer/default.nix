{ pkgs, ... }:
# --- fast tldr implementation --- #
{
  home.packages = [ pkgs.tealdeer ];

  xdg.configFile.tealdeer = {
    source = ./config.toml;
    target = "./tealdeer/config.toml";
  };
}
