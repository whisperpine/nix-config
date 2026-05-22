{
  pkgs,
  lib,
  config,
  ...
}:
# --- voice-to-text --- #
let
  repoDir = builtins.getEnv "PWD";
  voxtypeConfig = "${repoDir}/home/voxtype/config.toml";
in
{
  home.packages = with pkgs; [ voxtype ];

  xdg.configFile.voxtype = {
    source = config.lib.file.mkOutOfStoreSymlink voxtypeConfig;
    target = "./voxtype/config.toml";
  };

  # The systemd service to auto start voxtype.
  systemd.user.services.voxtype = lib.mkForce {
    Unit = {
      Description = "Voxtype push-to-talk voice-to-text daemon";
      Documentation = "https://voxtype.io";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.voxtype-vulkan}/bin/voxtype daemon";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
