{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  niriConfig = "${repoDir}/home/niri";
in
{
  home.packages = with pkgs; [
    niri
    xwayland-satellite
  ];
  xdg.configFile.niri = {
    source = config.lib.file.mkOutOfStoreSymlink niriConfig;
  };
}
