{ pkgs, ... }:
{
  home.packages = [ pkgs.marksman ];

  xdg.configFile.marksman = {
    source = ./config.toml;
    target = "./marksman/config.toml";
  };
}
