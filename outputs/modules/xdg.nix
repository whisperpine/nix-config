{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
    # https://mynixos.com/nixpkgs/option/xdg.portal.config
    config = {
      # Specify preferred portal implementations.
      common.default = [ "gtk" ];
    };
  };

  # xdg.portal: since you installed Home Manager via its NixOS module and
  # 'home-manager.useUserPackages' is enabled, you need to add this so that
  # the portal definitions and DE provided configurations get linked.
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
