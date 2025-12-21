{ config, ... }:
# --- customizable wayland bar --- #
let
  repoDir = builtins.getEnv "PWD";
  waybarConfig = "${repoDir}/home/waybar";
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    # Ensures it starts after niri session.
    systemd.target = "niri.service";
  };

  xdg.configFile.waybar = {
    source = config.lib.file.mkOutOfStoreSymlink waybarConfig;
    target = "./waybar";
  };
}
