{ ... }:
{
  # GTK requires dconf.
  gtk = {
    enable = true;
    # System settings for dark theme.
    colorScheme = "dark";
  };
}
