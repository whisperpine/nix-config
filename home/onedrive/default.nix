{ config, ... }:
# --- onedrive client for linux --- #
let
  repoDir = builtins.getEnv "PWD";
  onedriveConfig = "${repoDir}/home/onedrive/config";
  syncListConfig = "${repoDir}/home/onedrive/sync_list";
in
{
  programs.onedrive.enable = true;

  xdg.configFile.onedriveConfig = {
    source = config.lib.file.mkOutOfStoreSymlink onedriveConfig;
    target = "./onedrive/config";
  };

  xdg.configFile.onedriveSyncList = {
    source = config.lib.file.mkOutOfStoreSymlink syncListConfig;
    target = "./onedrive/sync_list";
  };
}
