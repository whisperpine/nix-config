{ ... }:
# ----------  steam configs ---------- #
{
  # Enable steam.
  programs.steam.enable = true;

  # Enable Gamescope (highly recommended for Wayland/Niri).
  # This allows you to run games in a micro-compositor to fix resolution/focus issues.
  programs.steam.gamescopeSession.enable = true;
}
