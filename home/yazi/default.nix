{ ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  xdg.configFile.yazi.source = ../yazi;

  # This modifies files under:
  # /etc/profiles/per-user/yusong/share/applications
  xdg.desktopEntries.yazi = {
    name = "yazi"; # name is required to build
    noDisplay = true; # hide in app launchers (e.g. fuzzel)
  };
}
