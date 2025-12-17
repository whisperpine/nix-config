{ config, ... }:
# --- terminal file manager --- #
let
  repoDir = builtins.getEnv "PWD";
  yaziConfig = "${repoDir}/home/yazi";
  mklink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile.yazi.source = mklink yaziConfig;
}
