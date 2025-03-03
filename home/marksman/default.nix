{ pkgs, ... }:
{
  home.packages = [ pkgs.marksman ];

  xdg.configFile.marksman = {
    enable = true;
    source = ./config.toml;
    target = "./marksman/config.toml";
  };
}
