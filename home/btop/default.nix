{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      color_theme = "everforest-dark-medium";
      vim_keys = true;
      update_ms = 500;
      proc_tree = true;
      rounded_corners = false;
    };
  };

  # This modifies files under:
  # /etc/profiles/per-user/yusong/share/applications
  xdg.desktopEntries.btop = {
    name = "btop"; # name is required to build
    noDisplay = true; # hide in app launchers (e.g. fuzzel)
  };
}
