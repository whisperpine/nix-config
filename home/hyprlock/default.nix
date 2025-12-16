{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  hyprlockConfig = "${repoDir}/home/hyprlock/hyprlock.conf";
in
{
  home.packages = with pkgs; [ hyprlock ];
  xdg.configFile.hyprlock = {
    source = config.lib.file.mkOutOfStoreSymlink hyprlockConfig;
    target = "./hypr/hyprlock.conf";
  };
}
