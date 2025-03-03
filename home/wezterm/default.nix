{ ... }:
{
  # if wezterm is installed in system level,
  # there's no need to install it by home-manager.
  # (e.g. on darwin platform)
  programs.wezterm = {
    enable = true;
  };

  xdg.configFile.wezterm = {
    enable = true;
    recursive = true;
    source = ../wezterm;
  };
}
