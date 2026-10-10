{ pkgs, config, ... }:
# --- cargo configs --- #
let
  repoDir = builtins.getEnv "PWD";
  sccacheConfig = "${repoDir}/home/sccache/config";
in
{
  home.packages = with pkgs; [ sccache ];

  xdg.configFile.sccache = {
    source = config.lib.file.mkOutOfStoreSymlink sccacheConfig;
    target = "./sccache/config";
  };
}
