{ ... }:
{
  # if alacritty is installed in system level,
  # there's no need to install it by home-manager.
  # (e.g. on darwin platform)
  programs.alacritty = {
    enable = true;
  };

  xdg.configFile.alacritty = {
    enable = true;
    source = ./alacritty.toml;
    target = "./alacritty/alacritty.toml";
  };
}
