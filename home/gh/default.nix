{ pkgs, config, ... }:
let
  ghConfig = "/etc/nixos/home/gh/config.yml";
in
{
  home.packages = with pkgs; [ gh ];
  xdg.configFile.gh = {
    source = config.lib.file.mkOutOfStoreSymlink ghConfig;
    target = "./gh/config.yml";
  };
}
