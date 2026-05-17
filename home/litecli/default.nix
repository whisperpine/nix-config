{ pkgs, config, ... }:
# --- cli for sqlite --- #
let
  repoDir = builtins.getEnv "PWD";
  litecliConfig = "${repoDir}/home/litecli/config";
in
{
  home.packages = with pkgs; [ litecli ];

  xdg.configFile.litecli = {
    source = config.lib.file.mkOutOfStoreSymlink litecliConfig;
    target = "./litecli/config";
  };
}
