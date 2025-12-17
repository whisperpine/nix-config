{ pkgs, ... }:
# --- terminal emulator --- #
{
  # If alacritty is installed in system level,
  # there's no need to install it by home-manager.
  # (e.g. on darwin platform)
  home.packages = with pkgs; [ alacritty ];

  xdg.configFile.alacritty = {
    source = ./alacritty.toml;
    target = "./alacritty/alacritty.toml";
  };
}
