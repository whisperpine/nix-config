{ username, ... }:
# ----------  system configs for darwin ---------- #
{
  system.primaryUser = username;
  # System preference.
  system.defaults = {
    dock.autohide = true;
    menuExtraClock.Show24Hour = true;
    finder.FXPreferredViewStyle = "clmv";
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
  };
}
