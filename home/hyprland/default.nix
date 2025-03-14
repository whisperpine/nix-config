{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
  };

  # Hint Electron apps to use Wayland.
  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
