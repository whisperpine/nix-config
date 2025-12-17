{ pkgs, ... }:
{
  # GTK requires dconf.
  gtk = {
    enable = true;
    # System settings for dark theme.
    colorScheme = "dark";
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };
}
