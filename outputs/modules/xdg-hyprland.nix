{ pkgs, ... }:
# ----------  xdg-hyprland configs ---------- #
{
  # Enable xdg-desktop-portal for Wayland and Hyprland.
  xdg.portal = {
    enable = true;
    wlr.enable = true; # enable Wayland backend for portals
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    # https://mynixos.com/nixpkgs/option/xdg.portal.config
    config = {
      # Specify preferred portal implementations for Hyprland.
      common.default = [ "hyprland" ];
    };
  };

  # Ensure necessary packages are installed.
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-hyprland
    kitty # required for the default Hyprland config
  ];

  # Enable Hyprland as the window manager.
  programs.hyprland = {
    enable = true;
    # Optional: Enable XWayland for compatibility.
    xwayland.enable = true;
  };

  # Optional, hint electron apps to use wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
