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
}
