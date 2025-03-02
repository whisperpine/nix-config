{ ... }:
{
  # wezterm is installed in system level.
  # there's no need to install it by home-manager.

  xdg.configFile.wezterm = {
    enable = true;
    recursive = true;
    source = ../wezterm;
  };
}
