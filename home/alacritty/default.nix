{ pkgs, config, ... }:
# --- terminal emulator --- #
let
  repoDir = builtins.getEnv "PWD";
  alacrittyConfig = "${repoDir}/home/alacritty/alacritty.toml";
in
{
  # If alacritty is installed in system level,
  # there's no need to install it by home-manager.
  # (e.g. on darwin platform)
  home.packages = with pkgs; [ alacritty ];

  xdg.configFile.alacritty = {
    source = config.lib.file.mkOutOfStoreSymlink alacrittyConfig;
    target = "./alacritty/alacritty.toml";
  };
}
