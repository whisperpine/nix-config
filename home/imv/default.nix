{ pkgs, ... }:
{
  home.packages = with pkgs; [ imv ];

  xdg.mimeApps.associations.added = {
    "image/jpeg" = "imv.desktop";
    "image/png" = "imv.desktop";
    "image/gif" = "imv.desktop";
    "image/webp" = "imv.desktop";
    "image/svg+xml" = "imv.desktop";
    "image/tiff" = "imv.desktop";
    "image/bmp" = "imv.desktop";
  };
}
