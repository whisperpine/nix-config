{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  niriConfig = "${repoDir}/home/niri/config.kdl";
in
{
  home.packages = with pkgs; [ niri ];
  xdg.configFile.niri = {
    source = config.lib.file.mkOutOfStoreSymlink niriConfig;
    target = "./niri/config.kdl";
  };
}
