{ ... }:
# https://wiki.hypr.land/Nix/Hyprland-on-Home-Manager/
{
  # Required for the default Hyprland config.
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  home.sessionVariables = {
    # If the cursor becomes invisible.
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint Electron apps to use Wayland.
    NIXOS_OZONE_WL = "1";
  };
}
