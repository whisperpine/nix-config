{ pkgs, config, ... }:
let
  repoDir = builtins.getEnv "PWD";
  weztermConfig = "${repoDir}/home/wezterm";
in
{
  # If wezterm is installed in system level,
  # there's no need to install it by home-manager.
  # (e.g. on darwin platform)
  home.packages = with pkgs; [ wezterm ];

  xdg.configFile.wezterm = {
    source = config.lib.file.mkOutOfStoreSymlink weztermConfig;
  };
}
