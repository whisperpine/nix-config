{ pkgs, config, ... }:
# --- fast tldr implementation --- #
let
  repoDir = builtins.getEnv "PWD";
  tealdeerConfig = "${repoDir}/home/tealdeer/config.toml";
in
{
  home.packages = [ pkgs.tealdeer ];

  xdg.configFile.tealdeer = {
    source = config.lib.file.mkOutOfStoreSymlink tealdeerConfig;
    target = "./tealdeer/config.toml";
  };
}
