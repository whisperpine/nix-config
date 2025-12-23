{ pkgs, config, ... }:
# --- onedrive client for linux --- #
# To learn how to use, refer to the official docs:
# https://github.com/abraunegg/onedrive/blob/master/docs/usage.md
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

  systemd.user.services.onedrive = {
    Unit = {
      Description = "OneDrive Linux client";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };

    Service = {
      ExecStart = "${pkgs.onedrive}/bin/onedrive --monitor";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
