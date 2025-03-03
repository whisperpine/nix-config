{ ... }:
{
  # alacritty is installed in system level.
  # there's no need to install it by home-manager.

  xdg.configFile.alacritty = {
    enable = true;
    source = ./alacritty.toml;
    target = "./alacritty/alacritty.toml";
  };
}
