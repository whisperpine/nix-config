{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  fuzzelConfig = "${repoDir}/home/fuzzel/fuzzel.ini";
in
{
  home.packages = with pkgs; [ fuzzel ];
  xdg.configFile.fuzzel = {
    source = config.lib.file.mkOutOfStoreSymlink fuzzelConfig;
    target = "./fuzzel/fuzzel.ini";
  };
}
