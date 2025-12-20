{ pkgs, config, ... }:
# --- toolkit for desktop shell --- #
let
  repoDir = builtins.getEnv "PWD";
  quickshellConfig = "${repoDir}/home/quickshell";
in
{
  home.packages = with pkgs; [ quickshell ];
  xdg.configFile.quickshell = {
    source = config.lib.file.mkOutOfStoreSymlink quickshellConfig;
    target = "./quickshell";
  };
}
