{ pkgs, ... }:
# ----------  xserver configs ---------- #
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Use nvidia GPU driver (see also: ../hardware/nvidia.nix).
  services.xserver.videoDrivers = [ "nvidia" ];

  # Use "ly" as the display manager (user login interface).
  services.displayManager.ly = {
    enable = true;
    x11Support = false;
  };

  services.displayManager.sessionPackages = [ pkgs.niri ];

  # # Enable the GNOME Desktop Environment.
  # services.desktopManager.gnome.enable = true;
  # services.displayManager.gdm = {
  #   enable = true;
  #   autoSuspend = false;
  # };
}
