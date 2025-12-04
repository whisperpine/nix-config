{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    # Specify preferred portal implementations:
    # https://mynixos.com/nixpkgs/option/xdg.portal.config
    config.common.default = [ "gtk" ];
  };

  # Add the xdg-desktop-portal-wlr package into the xdg.portal.extraPortals
  # option, and provide the configuration file .
  xdg.portal.wlr.enable = true;

  # xdg.portal: since you installed Home Manager via its NixOS module and
  # 'home-manager.useUserPackages' is enabled, you need to add this so that
  # the portal definitions and DE provided configurations get linked.
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
