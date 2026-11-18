{ config, pkgs-stable, ... }:
# --- customizable wayland bar --- #
let
  repoDir = builtins.getEnv "PWD";
  waybarConfig = "${repoDir}/home/waybar";
in
{
  programs.waybar = {
    enable = true;
    # Waybar 0.16.0 regressed custom-module alignment; stay on 0.15.0
    # until https://github.com/Alexays/Waybar/issues/5338 is fixed.
    package = pkgs-stable.waybar;
    systemd.enable = true;
    # Ensures it starts after niri session.
    systemd.targets = [ "niri.service" ];
  };

  xdg.configFile.waybar = {
    source = config.lib.file.mkOutOfStoreSymlink waybarConfig;
    target = "./waybar";
  };
}
