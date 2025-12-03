{ ... }:
# ----------  xserver configs ---------- #
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Use nvidia GPU driver (see also: ../hardware/nvidia.nix).
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable wacome tablet support.
  services.xserver.wacom.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
}
