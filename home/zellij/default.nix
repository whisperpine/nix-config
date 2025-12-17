{ pkgs, config, ... }:
# --- terminal multiplexer --- #
let
  repoDir = builtins.getEnv "PWD";
  zellijConfig = "${repoDir}/home/zellij/config.kdl";
in
{
  home.packages = with pkgs; [ zellij ];
  xdg.configFile.zellij = {
    source = config.lib.file.mkOutOfStoreSymlink zellijConfig;
    target = "./zellij/config.kdl";
  };
}
